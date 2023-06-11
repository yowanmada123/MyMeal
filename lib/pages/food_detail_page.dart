// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'package:mymeal/pages/utils/colors.dart';

// class MovieDetailPage extends StatefulWidget {
//   const MovieDetailPage({super.key, required this.id});
//   final String id;

//   @override
//   State<MovieDetailPage> createState() => _MovieDetailPageState();
// }

// class _MovieDetailPageState extends State<MovieDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: BlocProvider(
//         create: (_) => widget.foodListBloc,
//         child: BlocListener<FoodListBloc, FoodListState>(
//           listener: (context, state) {},
//           child: BlocBuilder<FoodListBloc, FoodListState>(
//             builder: (context, state) {
//               print("state $state");
//               if (state is FoodListInitial) {
//                 return SliverToBoxAdapter(child: SizedBox(height: 60, child: buildLoading()));
//               } else if (state is FoodListLoading) {
//                 return SliverToBoxAdapter(child: SizedBox(height: 60, child: buildLoading()));
//               } else if (state is FoodListLoaded) {
//                 return _buildCard(context, state.foodList);
//               } else {
//                 return Container();
//               }
//             },
//           ),
//         ),
//       ),
//     );
    
//     Stack(
//       children: [
//             ClipRRect(
//                 child: Image.network(
//               width: double.infinity,
//               height: 550,
//               'https://image.tmdb.org/t/p/w500/${object!.posterPath}',
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Column(
//                   children: [
//                     Container(
//                       height: 400,
//                       color: OPrimaryBlack,
//                       alignment: Alignment.center,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(
//                             Icons.warning_rounded,
//                             color: Colors.red,
//                             size: 50,
//                           ),
//                           Text(
//                             'No Available Image',
//                             style: TextStyle(fontSize: 30, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             )),
//             CustomScrollView(
//               slivers: <Widget>[
//                 SliverAppBar(
//                   backgroundColor: Colors.transparent,
//                   title: Text(object!.title),
//                   centerTitle: true,
//                 ),
//                 SliverToBoxAdapter(
//                   child: Container(
//                     height: 200,
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Container(
//                     decoration: BoxDecoration(boxShadow: const [
//                       BoxShadow(
//                           color: Colors.grey, //New
//                           blurRadius: 1.0,
//                           offset: Offset(0, -1))
//                     ], color: OPrimaryBlack, borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
//                     child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 5,
//                             decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 2, color: Colors.white))),
//                           )
//                           // Icon(Icons.stripe)
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
//                           Text(object!.title).white().p20m(),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           SizedBox(
//                             height: 30,
//                             child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: object!.genres.length,
//                                 addRepaintBoundaries: true,
//                                 itemBuilder: (context, index) {
//                                   return Row(
//                                     children: [
//                                       Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)), child: Text(object!.genres[index].name).black().p10r()),
//                                       const SizedBox(
//                                         width: 10,
//                                       )
//                                     ],
//                                   );
//                                 }),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: const [
//                                   Icon(
//                                     Icons.date_range,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text(object!.releaseDate.toYear()).clamGrey().p12r(),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               const Icon(
//                                 Icons.circle,
//                                 color: Colors.white,
//                                 size: 5,
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               const Icon(
//                                 Icons.timelapse_rounded,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text("${durationToString(object!.runtime)} min").clamGrey().p12r(),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               const Icon(
//                                 Icons.circle,
//                                 color: Colors.white,
//                                 size: 5,
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               const Icon(
//                                 Icons.remove_red_eye,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text("${object!.voteCount} Votes").clamGrey().p12r(),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                                   height: 28,
//                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: OPrimaryColor),
//                                   child: Row(
//                                     children: [
//                                       const Icon(
//                                         Icons.star,
//                                         size: 13,
//                                       ),
//                                       const SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text("${object!.voteAverage}").black().p12m(),
//                                     ],
//                                   )),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Divider(
//                             color: Colors.white,
//                             height: 2,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text("Tagline").clamGrey().p15b(),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(object!.tagline == "" ? "-" : object!.tagline).clamGrey().p12r(),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text("Language").clamGrey().p15b(),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           SizedBox(
//                             height: 30,
//                             child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: object!.spokenLanguages.length,
//                                 addRepaintBoundaries: true,
//                                 itemBuilder: (context, index) {
//                                   return index == object!.spokenLanguages.length - 1
//                                       ? Row(
//                                           children: [
//                                             Text(object!.spokenLanguages[index].name).clamGrey().p13r(),
//                                           ],
//                                         )
//                                       : Row(
//                                           children: [
//                                             Text("${object!.spokenLanguages[index].name}, ").clamGrey().p13r(),
//                                           ],
//                                         );
//                                 }),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text("Plot Summary").clamGrey().p15b(),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             object!.overview,
//                             textAlign: TextAlign.justify,
//                           ).clamGrey().p12r(),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const Text("Homepage").clamGrey().p15b(),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           GestureDetector(
//                               onTap: () async {
//                                 final Uri _url = Uri.parse(object!.homepage);
//                                 try {
//                                   if (!await launchUrl(_url)) {
//                                     throw Exception('Could not launch $_url');
//                                   }
//                                 } catch (e) {
//                                   print(e);
//                                 }
//                               },
//                               child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5), height: 40, decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))), child: Center(child: Text(object!.homepage == "" ? "-" : object!.homepage).black().p12m()))),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text("Production Company").clamGrey().p15b(),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           SizedBox(
//                             height: 90,
//                             child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: object!.productionCompanies.length,
//                                 addRepaintBoundaries: true,
//                                 itemBuilder: (context, index) {
//                                   return Row(
//                                     children: [
//                                       Column(
//                                         children: [
//                                           ClipRRect(
//                                               borderRadius: BorderRadius.circular(1000.0),
//                                               child: Image.network(
//                                                 width: 50,
//                                                 height: 50,
//                                                 'https://image.tmdb.org/t/p/w500/${object!.productionCompanies[index].logoPath}',
//                                                 fit: BoxFit.cover,
//                                                 errorBuilder: (context, error, stackTrace) {
//                                                   return Column(
//                                                     children: [
//                                                       Container(
//                                                         width: 50,
//                                                         height: 50,
//                                                         child: Icon(
//                                                           Icons.warning_rounded,
//                                                           color: Colors.red,
//                                                           size: 10,
//                                                         ),
//                                                         decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black38),
//                                                       )
//                                                     ],
//                                                   );
//                                                 },
//                                               )),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(object!.productionCompanies[index].name).clamGrey().p10r(),
//                                           Text(object!.productionCompanies[index].originCountry).grey().p10r(),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         width: 20,
//                                       )
//                                     ],
//                                   );
//                                 }),
//                           ),
//                           const SizedBox(
//                             height: 50,
//                           )
//                         ]),
//                       )
//                     ]),
//                   ),
//                 ),
//               ],
//             )]);
//     // FutureBuilder<void>(
//     //   future: _getDetailMovie(),
//     //   builder: (BuildContext context, AsyncSnapshot<void> data) {
//     //     Widget children;
//     //     // print(data.connectionState);
//     //     if (data.connectionState == ConnectionState.done) {
//     //       children = 
//     //       ]);
//     //     } else if (data.connectionState == ConnectionState.waiting) {
//     //       children = const SafeArea(
//     //         child: Center(
//     //           child: CircularProgressIndicator(),
//     //         ),
//     //       );
//     //     } else {
//     //       children = const Center(
//     //         child: Text("Coba Jek Konek Jaringan Anda"),
//     //       );
//     //     }
//     //     return Scaffold(body: children);
//     //   },
//     // );
//   }
// }

// String durationToString(int minutes) {
//   var d = Duration(minutes: minutes);
//   List<String> parts = d.toString().split(':');
//   return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
// }
