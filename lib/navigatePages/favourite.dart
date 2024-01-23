

import 'package:flutter/material.dart';
import 'package:foodie_zone/services/model/favoriteModel.dart';

class FavoritePage extends StatelessWidget {
  final List<FavoriteItemm> favoriteItems;

  const FavoritePage({Key? key, required this.favoriteItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1) ,
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          FavoriteItemm item = favoriteItems[index];

          return Container(
      child: Image.asset(item.image), // Assuming image is a path to an asset
          );
          
          },
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:foodie_zone/services/model/favoriteModel.dart';


// class FavoritePage extends StatelessWidget {
//    final List favoriteItems;

//   const FavoritePage({Key? key, required this.favoriteItems}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Items'),
//       ),
//       body: ListView.builder(
//         itemCount: favoriteItems.length,
//         itemBuilder: (context, index) {
//           FavoriteItemm item = favoriteItems[index];

//           return GestureDetector(
//             onTap: () {
//               // Handle tap on favorite item
//               print("Tapped on favorite item at index $index");
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: [
//                   Container(
//                     width: 200,
//                     height: 500,
//                   ),
//                   Positioned(
//                     top: 35,
//                     child: Container(
//                       width: 200,
//                       height: 240,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 235, 168, 168),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 40,
//                     child: CircleAvatar(
//                       radius: 60,
//                       backgroundImage: AssetImage(item.image),
//                     ),
//                   ),
//                   Positioned(
//                     top: 40,
//                     left: 160,
//                     child: IconButton(
//                       onPressed: () {
//                         // Handle tap on favorite icon
//                         print("Tapped on favorite icon at index $index");
//                       },
//                       icon: Icon(
//                         Icons.favorite,
//                         size: 25,
//                         color: Color.fromARGB(255, 252, 41, 4),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 120,
//                     left: 20,
//                     child: Text(
//                       item.textList,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 150,
//                     left: 20,
//                     child: Text(
//                       item.text1List,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 230,
//                     left: 20,
//                     child: Icon(
//                       Icons.star,
//                       color: Colors.yellow,
//                       size: 18,
//                     ),
//                   ),
//                   Positioned(
//                     top: 230,
//                     left: 40,
//                     child: Text(
//                       item.text2List,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }










// import 'package:flutter/material.dart';

// class FavoritePage extends StatelessWidget {
//   final List<String> favoriteItems;

//   const FavoritePage({Key? key, required this.favoriteItems}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Items'),
//       ),

// body: ListView.builder(
//   itemCount: favoriteItems.length,
//   itemBuilder: (context, index) {
//     // Access the properties of FavoriteItem


//     // String image = favoriteItems[index].image;
//     // String textList = favoriteItems[index].textList;
//     // String text1List = favoriteItems[index].text1List;
//     // String text2List = favoriteItems[index].text2List;

//     // Build your favorite item UI here
//     return GestureDetector(
//       onTap: () {
//         // Handle tap on favorite item
//         print("Tapped on favorite item at index $index");
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Stack(
//           children: [
//             Container(
//               width: 200,
//               height: 500,
//             ),
//             Positioned(
//               top: 35,
//               child: Container(
//                 width: 200,
//                 height: 240,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 235, 168, 168),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 40,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundImage: AssetImage(image),
//               ),
//             ),
//             Positioned(
//               top: 40,
//               left: 160,
//               child: IconButton(
//                 onPressed: () {
//                   // Handle tap on favorite icon
//                   print("Tapped on favorite icon at index $index");
//                 },
//                 icon: Icon(
//                   Icons.favorite,
//                   size: 25,
//                   color: Color.fromARGB(255, 252, 41, 4),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 120,
//               left: 20,
//               child: Text(
//                 textList,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 150,
//               left: 20,
//               child: Text(
//                 text1List,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 230,
//               left: 20,
//               child: Icon(
//                 Icons.star,
//                 color: Colors.yellow,
//                 size: 18,
//               ),
//             ),
//             Positioned(
//               top: 230,
//               left: 40,
//               child: Text(
//                 text2List,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   },
// ));



// //       body: ListView.builder(
// //         itemCount: favoriteItems.length,
// //         itemBuilder: (context, index) {
// //           // Build your favorite item UI here
// //           return ListTile(
// //             title: Text(favoriteItems[index].itemName),
// //             // Add more details as needed
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

































// // import 'package:flutter/material.dart';

// // class favorite extends StatefulWidget {
// //   const favorite({super.key});

// //   @override
// //   State<favorite> createState() => _favoriteState();
// // }

// // class _favoriteState extends State<favorite> {

// // //  List<bool> isSelectedList = List.generate(
// //       // 6, (index) => false); // Create a list to track individual selections

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("FAVORITE"),
// //       ),


// //   body: ListView.builder(
// //         itemCount: favoriteItems.length,
// //         itemBuilder: (context, index) {
// //           // Build your favorite item UI here
// //           return ListTile(
// //             title: Text(favoriteItems[index].itemName),
// //             // Add more details as needed
// //           );

          
// //         },
// //       ),



    
// //       // body: ListView.builder(
// //       //   itemCount: favorite.isSelectedList.length,
// //       //   itemBuilder: (context, index) {
// //       //     if (favorite.isSelectedList[index]) {
            
// //       //       // Display the favorite item
// //       //       return ListTile(
// //       //         title: Text('Favorite Item $index'),
// //       //         // Add other details as needed
              
// //       //       );
// //       //     } else {
// //       //       return Container(); // Empty container if the item is not a favorite
// //       //     }
// //       //   },
// //       // ),

// //  );
// //   }
// // }









// //       // body: TabBarView(
// //       //   children: [
// //       //     ListView.builder(
// //       //       itemCount: mainDataList.length,
// //       //       itemBuilder: (context, index) {
// //       //         return Card(
// //       //           child: Row(
// //       //             children: [
// //       //               Expanded(
// //       //                 child: Padding(
// //       //                   padding: const EdgeInsets.all(20.0),
// //       //                   child: Text(
// //       //                     mainDataList[index],
// //       //                     style: const TextStyle(fontSize: 19.0),
// //       //                   ),
// //       //                 ),
// //       //               ),
// //       //               ElevatedButton(
// //       //                 onPressed: () {
// //       //                   setState(() {
// //       //                     favoriteDataList.add(mainDataList[index]);
// //       //                   });
// //       //                 },
// //       //                 style: ButtonStyle(
// //       //                   backgroundColor: MaterialStateProperty.all<Color>(
// //       //                     Colors.deepPurple,
// //       //                   ),
// //       //                 ),
// //       //                 child: const Icon(
// //       //                   Icons.favorite,
// //       //                   color: Colors.white,
// //       //                 ),
// //       //               ),
// //       //             ],
// //       //           ),
// //       //         );
// //       //       },
// //       //     ),
// //       //     favoriteDataList.isEmpty
// //       //         ? const Center(
// //       //             child: Text(
// //       //               'There are no favorites yet!',
// //       //               style: TextStyle(color: Colors.black),
// //       //             ),
// //       //           )
// //       //         : ListView.builder(
// //       //             itemCount: favoriteDataList.length,
// //       //             itemBuilder: (context, index) {
// //       //               return Card(
// //       //                 child: Row(
// //       //                   children: [
// //       //                     Expanded(
// //       //                       child: Padding(
// //       //                         padding: const EdgeInsets.all(20.0),
// //       //                         child: Text(
// //       //                           favoriteDataList[index],
// //       //                           style: const TextStyle(fontSize: 19.0),
// //       //                         ),
// //       //                       ),
// //       //                     ),
// //       //                     ElevatedButton(
// //       //                       onPressed: () {
// //       //                         setState(() {
// //       //                           favoriteDataList
// //       //                               .remove(favoriteDataList[index]);
// //       //                         });
// //       //                       },
// //       //                       style: ButtonStyle(
// //       //                         backgroundColor:
// //       //                             MaterialStateProperty.all<Color>(
// //       //                           Colors.deepPurple,
// //       //                         ),
// //       //                       ),
// //       //                       child: const Icon(
// //       //                         Icons.remove,
// //       //                         color: Colors.white,
// //       //                       ),
// //       //                     ),
// //       //                   ],
// //       //                 ),
// //       //               );
// //       //             },
// //       //           ),
// //       //   ],
// //       // ),

// //       //  body: ListView.builder(
// //       //   itemCount: favorite.isSelectedList.length,
// //       //   itemBuilder: (context, index) {
// //       //     if (favorite.isSelectedList[index]) {
// //       //       // Display the favorite item
// //       //       return ListTile(
// //       //         title: Text('Favorite Item $index'),
// //       //         // Add other details as needed
// //       //       );
// //       //     } else {
// //       //       return Container(); // Empty container if the item is not a favorite
// //       //     }
// //       //   },
// //       // ),
   
//   }}