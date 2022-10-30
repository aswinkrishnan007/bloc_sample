// import 'package:flutter/material.dart';


// class ListingView extends StatelessWidget {
//   const ListingView({
//     Key? key,
//     required this.controller,
//     required MyHomeViewModel viewModel,
//   })  : _viewModel = viewModel,
//         super(key: key);

//   final ScrollController controller;
//   final MyHomeViewModel _viewModel;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height - 150,
//       child: ListView.builder(
//         controller: controller,
//         itemCount: _viewModel.lazyloading.length,
//         itemBuilder: (context, index) {
//           return singleCard(context, index);
//         },
//       ),
//     );
//   }

//   GestureDetector singleCard(BuildContext context, int index) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           PageRouteBuilder(
//             opaque: false,
//             barrierColor: Colors.black,
//             pageBuilder: (BuildContext context, _, __) {
//               return FullScreenPage(
//                 child: Image.network(
//                   _viewModel.lazyloading[index].userImageURL,
//                   fit: BoxFit.contain,
//                 ),
//               );
//             },
//           ),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: Colorconstants.color1A059D)),
//         child: Row(
//           children: [
//             Container(
//               height: 100,
//               width: 100,
//               decoration: BoxDecoration(
//                   color: Colors.red,
//                   image: DecorationImage(
//                       image: NetworkImage(
//                         _viewModel.lazyloading[index].userImageURL,
//                       ),
//                       fit: BoxFit.cover),
//                   borderRadius: BorderRadius.circular(15)),
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             Text(
//               _viewModel.lazyloading[index].user,
//               style: TextStyle(
//                 color: Colorconstants.color1A059D,
//                 fontWeight: FontWeight.w400,
//                 fontStyle: FontStyle.normal,
//                 fontSize: 15,
//                 letterSpacing: 1,
//               ),
//             ),
//           ],
//         ),
//         height: 100,
//       ),
//     );
//   }
// }
