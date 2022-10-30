

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:search_with_bloc/model/search_model.dart';
import 'package:search_with_bloc/viewmodel/search_viewmodel.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {

    final SearchViewModel _searchViewmodel=SearchViewModel();
    on<SearchResult>((event, emit)async {
     
    try{
  emit(SearchLoading());
  final data=await _searchViewmodel.search(event.context,event.searchKey);
 SearchModel searchdata = SearchModel.fromJson(data);
    emit(SearchLoaded(searchdata));
       
    }
      on NetworkError{
       emit(SearchError("Failed to fetch data. is your device online?"));
   }
    });
  }
}
