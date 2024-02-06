import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/services/model/recipedupe.dart';
import 'package:foodie_zone/services/model/recipe.model.dart';

// class Breakfast extends StatefulWidget {
//   const Breakfast({super.key});

//   @override
//   State<Breakfast> createState() => _BreakfastState();
// }

// class _BreakfastState extends State<Breakfast> {
//   bool isSelected = true;
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
//         body: SafeArea(
//       child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   "BreakFast",
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
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> RecipePage()));
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
//     ));
//   }
// }








class Breakfast extends StatefulWidget {
 

   Breakfast({super.key});

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  final String userId = "";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("recipe").snapshots(),
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
                                builder: (context) => FirebaseDataScreen(model.id)
                                  
                              
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
// import 'package:foodie_zone/blank.dart';
// // import 'package:foodie_zone/searchBar.dart';

// class Breakfast extends StatefulWidget {
//   const Breakfast({super.key});

//   @override
//   State<Breakfast> createState() => _BreakfastState();
// }

// class _BreakfastState extends State<Breakfast> {

// List<String> imagesList = [

//     // 'assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg',
     
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
//   List<String> textList = [
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
//       body: ListView(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//         children: [
//           Row(
//             children: [
//               // TextButton.icon(onPressed: (){}, child: Text('Breakfast'),icon: Icons.food_bank,),
//               Container(
//                 height: 50,
//                 width: 155,
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                         width: 2,
//                         color: const Color.fromARGB(255, 252, 216, 214)),
//                     borderRadius: BorderRadius.circular(25)),
//                 child: TextButton.icon(
//                     onPressed: () {},
//                     icon: Icon(Icons.food_bank),
//                     label: Text('Breakfast')
//                     ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           // SearchBarApp(),
//           Container(
//             width: 350,
//             height: 50,
//             padding: EdgeInsets.only(left: 25),
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: const TextField(
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 // suffixIcon: Icon(Icons.delete_forever),
//                 // label:Icon(Icons.search),
      
//                 hintText: "Search what you want ",
//                 hintStyle: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
      
      
//           Expanded(
          
//             child: GridView.builder(
             
            
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 //  childAspectRatio: 1.1,
            
//                 ),
//                 itemCount: imagesList.length,
//                itemBuilder:(context, index){
//                 return  Stack(
//                   children: [
//             Container(
//               width: 200,
//               height: 450,
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 223, 189, 189), borderRadius: BorderRadius.circular(20)),
//                     child: GestureDetector(
//             onTap: (){
//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlankPage()));
//             },
//             child: Image.asset(imagesList[index],fit: BoxFit.cover,
            
//             ),
//                     ),
//             ),
//             Positioned(
//               bottom: 0,
//               child:Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(textList[index], style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
//               ))
            
//                     ] );
//                } 
//                 ),
//           )
//         ])
//      );
    
  
  
//    }
//   }
   

