import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_with_bloc/bloc/search/search_bloc.dart';

import 'package:search_with_bloc/constants.dart';
import 'package:search_with_bloc/model/search_model.dart';
import 'package:search_with_bloc/viewmodel/search_viewmodel.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _controller = TextEditingController();
  ScrollController controller = ScrollController();

  final SearchBloc _view = SearchBloc();

  @override
  void initState() {
    _view.add(SearchResult(
      "",
      context,
    ));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colorconstants.colorF1EFFF,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: BlocProvider(
              create: (context) => _view,
              child: BlocListener<SearchBloc, SearchState>(
                listener: (context, state) {
                  if (state is SearchError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error!),
                      ),
                    );
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    searchArea(),
                    const SizedBox(height: 25),
                    BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state is SearchInitial) {
                          return Container();
                        } else if (state is SearchLoaded) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 150,
                            child: ListView.builder(
                              controller: controller,
                              itemCount: state.searchmodel.hits.length,
                              itemBuilder: (context, index) {
                                return singleCard(
                                    context, index, state.searchmodel.hits);
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      )),
    );
  }

  GestureDetector singleCard(BuildContext context, int index, List<Hits> hits) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     opaque: false,
        //     barrierColor: Colors.black,
        //     pageBuilder: (BuildContext context, _, __) {
        //       return FullScreenPage(
        //         child: Image.network(
        //           _viewModel.lazyloading[index].userImageURL,
        //           fit: BoxFit.contain,
        //         ),
        //       );
        //     },
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colorconstants.color1A059D)),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(
                        hits[index].userImageURL,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15)),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              hits[index].user,
              style: TextStyle(
                color: Colorconstants.color1A059D,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 15,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        height: 100,
      ),
    );
  }

  SizedBox noDataFound() {
    return SizedBox(
      child: Center(
        child: Text(
          "no data found !!",
          style: TextStyle(
            color: Colorconstants.color1A059D,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 15,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Container searchArea(
      //   BuildContext context,
      ) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colorconstants.color9745FF.withOpacity(.6),
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0)),
      ),
      child: Container(
          margin:
              const EdgeInsets.only(left: 15, right: 15, bottom: 25, top: 20),
          padding: const EdgeInsets.only(left: 0),
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Colorconstants.color1A059D.withOpacity(.52), width: 1),
            color: Colorconstants.colorFFFFFF,
          ),
          child: TextFormField(
            controller: _controller,
            onTap: () {},
            autofocus: false,
            cursorColor: Colorconstants.color1A059D,
            style: TextStyle(
              color: Colorconstants.color1A059D,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 15,
              letterSpacing: 1,
            ),
            decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colorconstants.color1A059D,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colorconstants.color1A059D,
                    size: 15,
                  ),
                  onPressed: () {
                    _controller.clear();
                    _view.add(SearchResult(
                      _controller.text,
                      context,
                    ));
                  },
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colorconstants.color1A059D,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
                border: InputBorder.none),
            onChanged: (value) {
              _view.add(SearchResult(
                _controller.text,
                context,
              ));
            },
          )),
    );
  }
}
