// import 'package:nameshow/const/linkers.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('API Demo'),
//         ),
//         body: Center(
//           child: FutureBuilder<Map<String, dynamic>>(
//             future: fetchData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 // Use the data from the API response
//                 final data = snapshot.data;
//                 return Text('Show Name: ${data?['name']}');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }


// GridView.builder(
//   shrinkWrap: true,
//   itemCount: items.length,
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     mainAxisSpacing: 8,
//     crossAxisSpacing: 8,
//     mainAxisExtent: 240,
//   ),
//   itemBuilder: (context, index) {
//     return Stack(
//       children: [
//         // Background Image
//         Image.network(
//           items[index].imageURL.toString(),
//           fit: BoxFit.cover,
//           height: double.infinity,
//           width: double.infinity,
//         ),

//         // Column on top of the background image
//         Column(
//           children: [
//             // Your other widgets...

//             const Divider(),

//             Text(
//               "Rating : ${items[index].rating.toString()}",
//               textAlign: TextAlign.center,
//             ),

//             // Your other widgets...
//           ],
//         ),
//       ],
//     )
//     .box
//     .white
//     .rounded
//     .clip(Clip.antiAlias)
//     .outerShadowMd
//     .make()
//     .onTap(() {
//       Get.to(() => MovieDetails());
//     });
//   },
// )
