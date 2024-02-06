import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/services/model/dinnerData.dart';
import 'package:foodie_zone/services/model/recipe.model.dart';

class Dinner extends StatefulWidget {

   Dinner({super.key});

  @override
  State<Dinner> createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  final String userId = "";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("dinner").snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return Scaffold(
            body:
             Center(
                child: Container(
                    child: Column(
              children: [
                Image.asset("assets/cookiegrl.jpg"),
                Text('Your Cart is empty'),
              ],
            ))),
          );
        } else {
          return Scaffold(
            backgroundColor: Color(0xFFF5F6F9),
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              //   backgroundColor: AppColors.white,
              leading: BackButton(),

              title: Column(
                children: [
                  Text(
                    "RECIPIES",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            body: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  RecipeModel model = RecipeModel.getModelFromJson(
                      json: snapshot.data!.docs[index].data());
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading:CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  model.image
                                    ),
                              ), 
                    
                      title: Text(model.recipeName),
                      // subtitle: Text(model.instructions[index]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DinnerData(model.id)
                                
                                ));
                      },
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:foodie_zone/recipedupe.dart';

// class Dinner extends StatefulWidget {
//   const Dinner({super.key});

//   @override
//   State<Dinner> createState() => _DinnerState();
// }

// class _DinnerState extends State<Dinner> {
//    bool isSelected = true;
//   // 'assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg',
//   List<String> imagesList = [
//     'assets/photos-2015-1-11-10-4-51.jpg',
//     'assets/photo.jpg',
//     'assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg',
//     'assets/image.jpg',
//     'assets/d449fc5060af982a2cb65498d9e85412.jpg',
//     'assets/MasalaDosa.webp',
//     'assets/wp8365304.jpg',
//     'assets/upma.webp',
//     'assets/bacon-egg-potato-breakfast-skillet.jpg',
//     'assets/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__images__2017__03__20170305-vegan-breakfast-recipes-roundup-05-ffd21afa078c451b8d5a55f30f28c523.webp',
//   ];

//   List<String> text1List = [
//     'Chappathi & \n sambar',
//     'Idali with curry',
//     'Gulgul_Barane',
//     'Putt & \n Beef',
//     'Poori & \n Baji',
//     'Masala Dosa',
//     'Porotta',
//     'Upma',
//     'Becon_egg',
//     'Pan Cake',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//  body: SafeArea(
//       child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   "Dinner",
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.food_bank_outlined,
//                     size: 25,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: Icon(Icons.search),
//                   hintStyle: TextStyle(
//                       color: const Color.fromARGB(255, 129, 128, 123)),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                           width: 4, color: Color.fromARGB(255, 0, 0, 0)))),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: AlwaysScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: imagesList.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage ()));
//                     },
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: 200,
//                           width: 200,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 223, 189, 189),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Image.asset(
//                             imagesList[index],
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 10,
//                           left: 8,
//                           right: 8,
//                           child: Text(
//                             text1List[index],
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Positioned(
//                           right: 10,
//                           child: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   isSelected = !isSelected;
//                                 });
//                               },
//                               icon: Icon(Icons.favorite,
//                                   size: 25,
//                                   color: isSelected
//                                       ? Colors.red
//                                       : Color.fromARGB(255, 117, 137, 150))),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ])
          
//           ),
//     )
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // /// Flutter code sample for [SearchBar].

// // // void main() => runApp(const SearchBarApp());

// // class SearchBarApp extends StatefulWidget {
// //   const SearchBarApp({super.key});

// //   @override
// //   State<SearchBarApp> createState() => _SearchBarAppState();
// // }

// // class _SearchBarAppState extends State<SearchBarApp> {
// //   bool isDark = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     final ThemeData themeData = ThemeData(
// //         useMaterial3: true,
// //         brightness: isDark ? Brightness.dark : Brightness.light);

// //     return MaterialApp(
// //       theme: themeData,
// //       home: Scaffold(
// //         // appBar: AppBar(title: const Text('Search Bar Sample')),
// //         body: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: SearchAnchor(
// //               builder: (BuildContext context, SearchController controller) {
// //             return SearchBar(
// //               controller: controller,
// //               padding: const MaterialStatePropertyAll<EdgeInsets>(
// //                   EdgeInsets.symmetric(horizontal: 16.0)),
// //               onTap: () {
// //                 controller.openView();
// //               },
// //               onChanged: (_) {
// //                 controller.openView();
// //               },
// //               leading: const Icon(Icons.search),
// //               trailing: <Widget>[
// //                 Tooltip(
// //                   message: 'Change brightness mode',
// //                   child: IconButton(
// //                     isSelected: isDark,
// //                     onPressed: () {
// //                       setState(() {
// //                         isDark = !isDark;
// //                       });
// //                     },
// //                     icon: const Icon(Icons.wb_sunny_outlined),
// //                     selectedIcon: const Icon(Icons.brightness_2_outlined),
// //                   ),
// //                 )
// //               ],
// //             );
// //           }, suggestionsBuilder:
// //                   (BuildContext context, SearchController controller) {
// //             return List<ListTile>.generate(5, (int index) {
// //               final String item = 'item $index';
// //               return ListTile(
// //                 title: Text(item),
// //                 onTap: () {
// //                   setState(() {
// //                     controller.closeView(item);
// //                   });
// //                 },
// //               );
// //             });
// //           }),
// //         ),
// //       ),
// //     );
// //   }
// // }
