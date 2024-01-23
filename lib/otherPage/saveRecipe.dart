




// import 'package:flutter/material.dart';
// import 'package:foodie_zone/services/authStatus.dart/recipeMethod.dart';

// // ignore: must_be_immutable
// class SaveRecipe extends StatefulWidget {


//    SaveRecipe({
//     Key ? key
//   }): super(key: key);

//   @override
//   State<SaveRecipe> createState() => _SaveRecipeState();
// }

// class _SaveRecipeState extends State<SaveRecipe> {
//   final _formKey = GlobalKey<FormState>();

//  String recipeName = "";
//   String image="";
//   String title = "";
//   String ingredients = "";
//   String instructions = "";
//   // bool _isLoading = false;

//   final TextEditingController recipeNameController = TextEditingController();
//   final TextEditingController ingredientsController = TextEditingController();
//   final TextEditingController instructionsController = TextEditingController();
//   final TextEditingController titleController = TextEditingController();
//     final TextEditingController imageController = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     // return Stack(
//     //   children: [
//     //    Container(
//     //       height: double.infinity,
//     //       child: Image.asset(
//     //         'assets/360_F_284468940_1bg6BwgOfjCnE3W0wkMVMVqddJgtMynE.jpg',fit: BoxFit.contain,
//     //       ),
//     //     ),


//     return Scaffold(
//           appBar: AppBar(
//             title: Text('Save recipe'),
//           ),
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Colors.white,

//           body: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                    Icon(
//                       Icons.camera_alt,
//                       color: Colors.white,
//                     ),
//                    TextField(
//                     decoration: InputDecoration(
//                       label: Text(recipeName)
//                     ),
//                       maxLines: 1,
//                     ),
//                    SizedBox(
//                       height: 16,
//                     ),
//                    TextField(
//                     decoration: InputDecoration(
//                       label: Text(ingredients)
//                     ),                    maxLines: 10,
//                     ),
//                    SizedBox(
//                       height: 16,
//                     ),
//                    TextField(
//                     decoration: InputDecoration(
//                       label: Text(instructions)
//                     ),      
//                                   maxLines: 20,
//                     ),
//                    SizedBox(
//                       height: 16,
//                     ),
//                    SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(30.0),
//                           ),
//                           primary: Colors.orangeAccent,
//                           padding:
//                           EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                           textStyle: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                         onPressed: () {
            
//                           RecipeMethods().recipeUser(recipeName: recipeName, ingredients: ingredients, instructions: instructions, image: "");
//                         },
//                         child: Text(
//                           'Save my recipe',
//                         ),
//                       ),
//                     )
//                  ],
//                 ),
//               ),
//             ),
//           ),
//         );
//     //  ],
//     // );
//   }
// }