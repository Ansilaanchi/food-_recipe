import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:foodie_zone/userPlatform/rFormModel.dart';
import 'package:foodie_zone/userPlatform/userPlat.dart';
import 'package:image_picker/image_picker.dart';

import 'recipeList.dart';


class RecipeForm extends StatefulWidget {
  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();
  File? _image;

  String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: ingredientsController,
                decoration: InputDecoration(
                    labelText: 'Ingredients', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: instructionsController,
                decoration: InputDecoration(
                    labelText: 'Instructions', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  showImagePickerOption(context);
                },
                child: Text('Pick an Image'),
              ),
              _image != null
                  ? Image.file(
                      _image!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  _addRecipe();
                },
                child: Text('Add Recipe'),
              ),
              
              SizedBox(height: 150),

              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 211, 213, 214),
                ),
                height: 80,
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    // Navigate to the RecipeList screen to view user's recipes
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeList()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'View Recipes',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
                

                
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 221, 234, 245),
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    _pickImageFromGallery();
                  },
                  child: const SizedBox(
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 55,
                        ),
                        Text("Gallery"),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pickImageFromCamera();
                  },
                  child: const SizedBox(
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          size: 55,
                        ),
                        Text("Camera"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final returnImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (returnImage == null) return;

      setState(() {
        _image = File(returnImage.path);
      });

      Navigator.of(context).pop();
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final returnImage =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (returnImage == null) return;

      setState(() {
        _image = File(returnImage.path);
      });

      Navigator.of(context).pop();
    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  Future<void> _addRecipe() async {
    String title = titleController.text;
    String ingredients = ingredientsController.text;
    String instructions = instructionsController.text;

    // Split the ingredients string into a list of strings
    List<String> ingredientList = ingredients.split(',');

    // Upload the image to Firebase Storage and get the download URL
    String imageUrl = await _uploadImageToStorage();

    UserRecipe newRecipe = UserRecipe(
      title: title,
      ingredients: ingredientList,
      instructions: instructions,
      imageUrl: imageUrl,
      uid: "",
    );


    // Call a function to add the recipe to Firestore
    _addRecipeToFirestore(newRecipe);
  }

  Future<String> _uploadImageToStorage() async {
    String imagePath = 'recipe_images/${DateTime.now().millisecondsSinceEpoch}';
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(imagePath);
    firebase_storage.UploadTask uploadTask = ref.putFile(_image!);

    await uploadTask.whenComplete(() => null);

    String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }

  void _addRecipeToFirestore(UserRecipe recipe) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('UserRecipe')
        .add({
      'title': recipe.title,
      'ingredients': recipe.ingredients,
      'instructions': recipe.instructions,
      'imageUrl': recipe.imageUrl,
    }).then((value) {
      // Navigate to a screen where users can view their recipes
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserPlatform()));
    }).catchError((error) {
      print("Failed to add recipe: $error");
    });
  }
}









// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/material.dart';
// import 'package:foodie_zone/userPlatform/rFormModel.dart';
// import 'package:foodie_zone/userPlatform/userPlat.dart';
// import 'package:image_picker/image_picker.dart';

// class RecipeForm extends StatefulWidget {
//   @override
//   _RecipeFormState createState() => _RecipeFormState();
// }

// class _RecipeFormState extends State<RecipeForm> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController ingredientsController = TextEditingController();
//   final TextEditingController instructionsController = TextEditingController();
//   File? _image;

//   String? uid = FirebaseAuth.instance.currentUser?.uid;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Recipe'),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: titleController,
//                   decoration: InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
//                 ),
//                 SizedBox(height: 30,),
          
//                 TextField(
//                   controller: ingredientsController,
//                   decoration: InputDecoration(labelText: 'Ingredients', border: OutlineInputBorder()),
//                 ),
//            SizedBox(height: 40,),
          
//                 TextField(
//                   controller: instructionsController,
//                   decoration: InputDecoration(labelText: 'Instructions', border: OutlineInputBorder()),
//                 ),
//                        SizedBox(height: 40,),
          
          
//                 ElevatedButton(
//                   onPressed: () {
//                  showImagePickerOption(context);
//                   },
//                   child: Text('Pick an Image'),
//                 ),
//                 _image != null
//                     ? Image.file(
//                         _image!,
//                         height: 100,
//                         width: 100,
//                         fit: BoxFit.cover,
//                       )
//                     : SizedBox.shrink(),
          
          
//                 SizedBox(height: 40),
//                 ElevatedButton(
//                   onPressed: () {
//                     _addRecipe();
          
                
//                   },
                  
//                   child: Text('Add Recipe'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//  void showImagePickerOption(BuildContext context) {
//     showModalBottomSheet(
//       backgroundColor: Color.fromARGB(255, 221, 234, 245),
//       context: context,
//       builder: (builder) {
//         return Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 5.5,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     _pickImageFromGallery();
//                   },
//                   child: const SizedBox(
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.image,
//                           size: 55,
//                         ),
//                         Text("Gallery"),
//                       ],
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     _pickImageFromCamera();
//                   },
//                   child: const SizedBox(
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.camera,
//                           size: 55,
//                         ),
//                         Text("Camera"),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _pickImageFromGallery() async {
//     try {
//       final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);

//       if (returnImage == null) return;

//       String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

//       if (!uid.isEmpty) {

//         Navigator.of(context).pop();
//       } else {
//         // Handle the case where UID is empty
//         print("Error: UID is empty.");
//       }
//     } catch (e) {
//       print("Error picking image from gallery: $e");
//     }
//   }

//   Future<void> _pickImageFromCamera() async {
//     String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

//     final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnImage == null) return;

//     Navigator.of(context).pop();
//   }


//   Future<void> _addRecipe() async {
//     String title = titleController.text;
//     List<String> ingredients = ingredientsController.text.split(',');
//     String instructions = instructionsController.text;

// // Navigator.push(context, MaterialPageRoute(builder: (context)=> UserPlatform()));

//     // Upload the image to Firebase Storage and get the download URL
//     String imageUrl = await _uploadImageToStorage();

//     UserRecipe newRecipe = UserRecipe(
//       title: title,
//       ingredients: ingredients,
//       instructions: instructions,
//       imageUrl: imageUrl,
//     );

//     // Call a function to add the recipe to Firestore
//     _addRecipeToFirestore(newRecipe);
//   }

//   Future<String> _uploadImageToStorage() async {
//     String imagePath = 'recipe_images/${DateTime.now().millisecondsSinceEpoch}';
//     firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child(imagePath);
//     firebase_storage.UploadTask uploadTask = ref.putFile(_image!);

//     await uploadTask.whenComplete(() => null);

//     String downloadUrl = await ref.getDownloadURL();
//     return downloadUrl;
//   }

//   void _addRecipeToFirestore(UserRecipe recipe) {
//     // Implement the logic to add the recipe to Firestore
//     // Use the Firebase plugin for Flutter
//     // For example:
//     FirebaseFirestore.instance.collection('users').doc(uid).collection('UserRecipe').add({
//       'title': recipe.title,
//       'ingredients': recipe.ingredients,
//       'instructions': recipe.instructions,
//       'imageUrl': recipe.imageUrl,
//     });
//   }
// }
