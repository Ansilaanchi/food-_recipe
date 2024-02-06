import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    String? uid = FirebaseAuth.instance.currentUser?.uid;


    return Stack(
      children: [
        _image != null
            ? Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: MemoryImage(_image!),
                ),
              )
            : FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance.collection("users").doc(uid).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/download (2).png"), // Add the placeholder image path
                      ),
                    );
                  }

                  String profilePic = snapshot.data!['profilepic'];

                  if (profilePic.isEmpty) {
                    // Handle the case where the profile picture is empty
                    return Center(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/download (2).png"), // Add the placeholder image path
                      ),
                    );
                  }

                  return Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(profilePic),
                    ),
                  );
                },
              ),
        Positioned(
          right: 90,
          bottom: 4,
          child: IconButton(
            onPressed: () {
              showImagePickerOption(context);
            },
            icon: Icon(
              Icons.add_a_photo,
              size: 30,
            ),
          ),
        ),
      ],
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
      final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (returnImage == null) return;

      String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

      if (!uid.isEmpty) {
        String imageUrl = await uploadImage(File(returnImage.path), uid);
        updateProfilePicture(uid, imageUrl);

        setState(() {
          selectedImage = File(returnImage.path);
          _image = File(returnImage.path).readAsBytesSync();
        });

        Navigator.of(context).pop();
      } else {
        // Handle the case where UID is empty
        print("Error: UID is empty.");
      }
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  Future<void> _pickImageFromCamera() async {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;

    String imageUrl = await uploadImage(File(returnImage.path), uid);
    updateProfilePicture(uid, imageUrl);

    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });

    Navigator.of(context).pop();
  }

  Future<String> uploadImage(File imageFile, String userId) async {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.then((p0) async {
        await storageReference.getDownloadURL().then((value) {
          print(value + "pppppppppppppppppppppppp");
          FirebaseFirestore.instance.collection('users').doc(uid).update({
            'profilepic': value,
          });
        });
      });

      String downloadUrl = await storageReference.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return "";
    }
  }

  void updateProfilePicture(String userId, String imageUrl) {
    try {
      FirebaseFirestore.instance.collection('users').doc(userId).update({
        'profilePic': imageUrl,
      });
    } catch (e) {
      print("Error updating profile picture: $e");
    }
  }

  // Function to get the user document
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocument() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Ensure user is signed in
      String uid = user.uid;

      // Retrieve the user document from Firestore
      return await FirebaseFirestore.instance.collection("users").doc(uid).get();
    } else {
      // Handle the case where the user is not signed in
      return Future.value(null);
    }
  }
}









/////////////////////////////
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie_zone/services/model/userModel.dart';
// // import 'package:foodie_zone/services/model/userModel.dart';
// import 'package:image_picker/image_picker.dart';

// // ignore: must_be_immutable
// class ProfileImage extends StatefulWidget {
//   // final String profilepic;
//    const ProfileImage({super.key });


//   @override
//   State<ProfileImage> createState() => _ProfileImageState();
// }

// class _ProfileImageState extends State<ProfileImage> {
//   Uint8List? _image;
//   File? imageFile;
//   File? selectedImage;
//   List<File> img = <File>[];

//   @override
//   Widget build(BuildContext context) {
//         String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

//     return Stack(
//       children: [
//         _image != null
//             ? Center(
//                 child: CircleAvatar(
//                   radius: 100,
//                   backgroundImage: MemoryImage(_image!),
//                 ),
//               )
//             : Center(
//                 child: CircleAvatar(
//                   radius: 100,
//                   backgroundImage: NetworkImage(
//                   UserModel.fromSnapshot(DocumentSnapshot<Object?>uid).profilepic,
                 
//                   ),
//                 ),
//               ),
//         Positioned(
//             right: 90,
//             bottom: 4,
//             child: IconButton(
//                 onPressed: () {
//                   showImagePickerOption(context);

//                updateProfilePicture(String userId, String imageUrl) {
//   try {
//     FirebaseFirestore.instance.collection('users').doc(userId).update({
//       'profilePic': imageUrl,
// });
//   } catch (e) {
//     print("Error updating profile picture: $e");
//   }
// }
//                 },
//                 icon: Icon(
//                   Icons.add_a_photo,
//                   size: 30,
//                 )))
//       ],
//     );
//   }

//   void showImagePickerOption(BuildContext context) {
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

//   Future _pickImageFromGallery() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) return;

//     // Upload the image to Firebase Storage and update profile picture URL
//     String imageUrl = await uploadImage(File(returnImage.path),
//         'userId'); // Replace 'userId' with the actual user ID
//     updateProfilePicture(
//         'profilePic', imageUrl); // Replace 'userId' with the actual user ID

//     setState(() {
//       selectedImage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });

//     Navigator.of(context).pop();
//   }

//   Future _pickImageFromCamera() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnImage == null) return;

//     // Upload the image to Firebase Storage and update profile picture URL
//     String imageUrl = await uploadImage(File(returnImage.path),
//         'userId'); // Replace 'userId' with the actual user ID
//     updateProfilePicture(
//         'userId', imageUrl); // Replace 'userId' with the actual user ID

//     setState(() {
//       selectedImage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });

//     Navigator.of(context).pop();
//   }
// }


// Future<String> uploadImage(File imageFile, String userId) async {
//   try {
//     Reference storageReference =
//         FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');
//     UploadTask uploadTask = storageReference.putFile(imageFile);
//     await uploadTask.then((p0)async{
//       await storageReference.getDownloadURL().then((value){
//         print(value+ "pppppppppppppppppppppppp");
//         FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
//       'profilepic': value,
//       // "email": FirebaseAuth.instance.currentUser!.email,
//       // "name": FirebaseAuth.instance.currentUser!.name,
//       // "uid":FirebaseAuth.instance.currentUser!.uid,
//       // "bio" :FirebaseAuth.instance.currentUser!.bio,

//     });
//       });
//     });

//     String downloadUrl = await storageReference.getDownloadURL();
//     return downloadUrl;
//   } catch (e) {
//     print("Error uploading image: $e");
//     return "";
//   }
// }

// void updateProfilePicture(String userId, String imageUrl) {
//   try {
//     FirebaseFirestore.instance.collection('users').doc(userId).update({
//       'profilePic': imageUrl,
// });
//   } catch (e) {
//     print("Error updating profile picture: $e");
//   }
// }

///////////////////////////////////////////////



//   // "https://firebasestorage.googleapis.com/v0/b/foodiezone-67697.appspot.com/o/profile_images%2FuserId.jpg?alt=media&token=4d501c44-a5c5-4fe6-ba01-0d668d045baf"
                //  profileData(),

//    void showImagePickerOption(BuildContext context) {
//     showModalBottomSheet(
//         backgroundColor: Color.fromARGB(255, 221, 234, 245),
//         context: context,
//         builder: (builder) {
//           return Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 5.5,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       _pickImageFromGallery();
//                     },
//                     child: const SizedBox(
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.image,
//                             size: 55,
//                           ),
//                           Text("Gallery"),
//                         ],
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       _pickImageFromCamera();
//                     },
//                     child: const SizedBox(
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.camera,
//                             size: 55,
//                           ),
//                           Text("Camera"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//  Future _pickImageFromGallery() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) return;
//     setState(() {
//       selectedImage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });
//     Navigator.of(context).pop();
//   }

//   //camera
//   Future _pickImageFromCamera() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnImage == null) return;
//     setState(() {
//       selectedImage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });
//     Navigator.of(context).pop();
//   }
// }

  
    
    
    
    
    
    
    
    
    
    
    
    
    
//     Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8)
//       ),
//       padding: EdgeInsets.only(left: 15, bottom: 15),
//       margin: EdgeInsets.only(left: 20, top: 20, right: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(widget.sectionName,style: TextStyle(color: Colors.grey[500]),),
//               IconButton(onPressed: widget.onPressed,
//                 // _showSettingsBottomSheet;
//     icon: Icon(Icons.settings),color: Colors.grey[400],)
//             ],
//           ),
//           Text(widget.text),
//         ],
//       ),
//     );
//   }
// }

// void showSettingsBottomSheet(BuildContext context, String documentId, String fieldToUpdate, String initialValue) {
//   TextEditingController _namecontroller = TextEditingController(text: initialValue);

//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(Icons.edit),
//               title: Text(fieldToUpdate),
//               subtitle: Text('Tap to edit'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _namecontroller,
//               decoration: InputDecoration(
//                 labelText: 'New $fieldToUpdate',
//               ),
//             ),
//             SizedBox(height: 10),

//             ElevatedButton(
//   onPressed: ()async{
//     try {
//       // Update data in Firestore
//       await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
//         "name": _namecontroller.text,
//       });
//       log("Profile name updated successfully");
   
//       // Call setState with a callback function to trigger a rebuild
//       // setState(() {
        
//       //   // Your additional code inside setState
//       //   // (if needed, such as updating local variables)
//       // });

//     } catch (e) {
//       throw Exception("Error updating profile name: $e");
//     }
//     Navigator.pop(context);
//   },
  
//   child: Text('Save'),
// ),

//           ],
//         ),
//       );
//     },
//   );
// }

// void oneshowSettingsBottomSheet(BuildContext context, String documentId, String fieldToUpdate, String initialValue) {
//   TextEditingController _biocontroller = TextEditingController(text: initialValue);

//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(Icons.edit),
//               title: Text(fieldToUpdate),
//               subtitle: Text('Tap to edit'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _biocontroller,
//               decoration: InputDecoration(
//                 labelText: 'New $fieldToUpdate',
//               ),
//             ),
//             SizedBox(height: 10),

//             ElevatedButton(
//   onPressed: ()async{
//     try {
//       // Update data in Firestore
//       await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
//         "bio": _biocontroller.text,
//       });
//       log("Profile bio updated successfully");
    

//     } catch (e) {
//       throw Exception("Error updating profile bio: $e");
//     }
//     Navigator.pop(context);
//   },
  
//   child: Text('Save'),
// ),

//           ],
//         ),
//       );
//     },
//   );
// }


