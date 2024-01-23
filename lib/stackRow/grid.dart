// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// class GridRowWidget extends StatefulWidget {
//   const GridRowWidget({super.key});

//   @override
//   State<GridRowWidget> createState() => _GridWidgetState();
// }

// class _GridWidgetState extends State<GridRowWidget> {
// // bool isSelected = true;
// bool a= true;

//   List<String> imagesList = [
//     'assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg',
//     'assets/photos-2015-1-11-10-4-51.jpg',
//     'assets/photo.jpg',
//     // 'assets/image.jpg',
//     // '',

//   ];
//   List<String> textList = [
//     'Gulgul_Barane',
//     'chappathi with Sambar',
//         'Idali with curry',

//   ]; 
//   List<String> text1List = [
//     'Tasty and \n Make easy',
//     'Yummy..',
//     'smoothyy idali',
//   ];
//   List<String> text2List = [
//     '4.4',
//     '3.1',
//     '4.0',
//   ];


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// body:  Container(
//               width: double.infinity,
//               height: 300,
//               color: Colors.white,
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: imagesList.length,
//                   itemBuilder: (context, index) => stackRow(imagesList[index],textList[index],
//                    text1List[index], text2List[index])),
//             ),

//     );
//   }

  
//   Padding stackRow(
//       String image, String textList,  String text1List, String text2List) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Stack(
//         children: [
//           Container(
//             color: Color.fromARGB(255, 94, 228, 105),
//             // margin: EdgeInsets.only(left: 15),
//             width: 200,
//             height: 500,

//             // color: Colors.amber,
//           ),
//           Positioned(
//             top: 35,
//             // left: 10,
//             child: Container(
//               width: 200,
//               height: 240,
//               decoration: BoxDecoration(
//                   color: Colors.grey, borderRadius: BorderRadius.circular(20)),
//             ),
//           ),
//           Positioned(
//             left: 40,
//             child: CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage(image),
//             ),
//           ),
//           Positioned(
//             top: 40,
//             left: 160,
//             child:IconButton(
//       onPressed: () {
//         setState(() {
//           a = !a;
//           print('a is now: $a');
//         });
//       },
//       icon: Icon(
//         Icons.ac_unit_outlined,
//         size: 25,
//         color: a ? Colors.blueAccent: Color.fromARGB(255, 117, 137, 150),
//       ),
//             ),
//           ),
//           Positioned(
//               top: 120,
//               left: 20,
//               child: Text(
//                 textList,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//             top: 220,
//             left: 150,
//             child: CircleAvatar(
//               backgroundImage: AssetImage("assets/images (1).png"),
//             ),
//           ),
//           Positioned(
//               top: 150,
//               left: 20,
//               child: Text(
//                 text1List,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//             top: 230,
//             left: 20,
//             child: Icon(
//               Icons.star,
//               color: Colors.yellow,
//               size: 18,
//             ),
//           ),
//           Positioned(
//               top: 230,
//               left: 40,
//               child: Text(
//                 text2List,
//                 style: TextStyle(
//                   color: Colors.white, fontSize: 16,
//                   // ,fontWeight: FontWeight.bold
//                 ),
//               )),
//         ],
//       ),
//     );
//   }

// }