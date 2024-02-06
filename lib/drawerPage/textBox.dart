import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TextBox extends StatefulWidget {
  String text;
  final String sectionName;

  TextBox({Key? key, required this.text, required this.sectionName, required Null Function() onPressed})
      : super(key: key);

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  TextEditingController _controller = TextEditingController();
   String bioText = '';  // Add this line

@override
void initState() {
  super.initState();
  // Fetch and update user data when the widget is first built
  _fetchAndUpdateUserData();

    // Fetch and log user data when the widget is first built
  _logInitialUserData();

}

void _fetchAndUpdateUserData() async {
  var snapshot = await getUserDocument();
  var userData = snapshot.data() as Map<String, dynamic>;
  setState(() {
    // Update local state variables
    widget.text = userData['name'] ?? '';
    // Use a separate variable for bio
    bioText = userData['bio'] ?? '';
  });
}


void _logInitialUserData() async {
  var snapshot = await getUserDocument();
  var userData = snapshot.data() as Map<String, dynamic>;
  print("Initial User Data: $userData");
}


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.only(left: 15, bottom: 15),
      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.sectionName, style: TextStyle(color: Colors.grey[500])),
              IconButton(
                onPressed: () {
                  _showSettingsBottomSheet(context, widget.sectionName, widget.text);
                },
                icon: Icon(Icons.settings),
                color: Colors.grey[400],
              )
            ],
          ),
            Text(widget.sectionName == 'name' ? widget.text : bioText),
        ],
      ),
    );
  }

void _showSettingsBottomSheet(BuildContext context, String fieldToUpdate, String initialValue) {
  _controller.text = initialValue;

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: Text(fieldToUpdate),
              subtitle: Text('Tap to edit'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'New $fieldToUpdate',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                try {
                  String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
                  if (fieldToUpdate == 'name') {
                    _updateName(uid, _controller.text);
                  } else if (fieldToUpdate == 'bio') {
                    _updateBio(uid, _controller.text);
                  }
                  log("Profile $fieldToUpdate updated successfully");

                  // Fetch and update the local state
                  var snapshot = await getUserDocument();
                  var userData = snapshot.data() as Map<String, dynamic>;
                  setState(() {
                    // Update local state variables
                                     widget.text = userData[fieldToUpdate] ?? '';
                      bioText = userData['bio'] ?? '';

                  });
                } catch (e) {
                  throw Exception("Error updating profile $fieldToUpdate: $e");
                }
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      );
    },
  );
}

void _updateName(String userId, String newName) {
  try {
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      'name': newName,
    });
  } catch (e) {
    print("Error updating profile name: $e");
  }
}

void _updateBio(String userId, String newBio) {
  try {
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      'bio': newBio,
    });
  } catch (e) {
    print("Error updating profile bio: $e");
  }
}


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
}}




// void showSettingsBottomSheet(BuildContext context, String documentId, String fieldToUpdate, String initialValue) {
//   TextEditingController _nameController = TextEditingController(text: initialValue);

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
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'New $fieldToUpdate',
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   // Update data in Firestore
//                   await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
//                     "name": _nameController.text,
//                   });

//                   log("Profile name updated successfully");

//                   // Trigger a rebuild of the widget tree
//                   setState(() {
//                     // Update local state variables if needed
//                     // userName = _nameController.text;
//                   });
//                 } catch (e) {
//                   throw Exception("Error updating profile name: $e");
//                 }
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// void showBioSettingsBottomSheet(BuildContext context, String documentId, String fieldToUpdate, String initialValue) {
//   TextEditingController _bioController = TextEditingController(text: initialValue);

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
//               controller: _bioController,
//               decoration: InputDecoration(
//                 labelText: 'New $fieldToUpdate',
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   // Update data in Firestore
//                   await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
//                     "bio": _bioController.text,
//                   });

//                   log("Profile bio updated successfully");

//                   // Trigger a rebuild of the widget tree
//                   setState(() {
//                     // Update local state variables if needed
//                     userBio = _bioController.text;
//                   });
//                 } catch (e) {
//                   throw Exception("Error updating profile bio: $e");
//                 }
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }




// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';



// // ignore: must_be_immutable
// class TextBox extends StatefulWidget {
//   final String text;
//   final String sectionName;
//   void Function()? onPressed;
//    TextBox({super.key, required this.text, required this.sectionName,required this.onPressed});

//   @override
//   State<TextBox> createState() => _TextBoxState();
// }

// class _TextBoxState extends State<TextBox> {
//   @override
//   Widget build(BuildContext context) {
//         String? uid = FirebaseAuth.instance.currentUser?.uid;

//     return Container(
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
   
//       updateText() {
//   try {
//     FirebaseFirestore.instance.collection('users').doc().update({
//       'name': _namecontroller,
      

// });
//   } catch (e) {
//     print("Error updating profile picture: $e");
//   }
// }


//     } catch (e) {
//       throw Exception("Error updating profile name: $e");
//     }
//     Navigator.pop(context);

//     // UserModel model = UserModel.getModelFromJson(
//                         // json: json.data!.docs.data());
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
//  updateBio() {
//   try {
//     FirebaseFirestore.instance.collection('users').doc().update({
//       'name': _biocontroller,
      
// });
//   } catch (e) {
//     print("Error updating profile picture: $e");
//   }
// }    

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











// // void oneshowSettingsBottomSheet(BuildContext context, String documentId, String fieldToUpdate, String initialValue) {
// //   TextEditingController _bioController = TextEditingController(text: initialValue);

// //   showModalBottomSheet(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return Container(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             ListTile(
// //               leading: Icon(Icons.edit),
// //               title: Text(fieldToUpdate),
// //               subtitle: Text('Tap to edit'),
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //             SizedBox(height: 10),
// //             TextField(
// //               controller: _bioController,
// //               decoration: InputDecoration(
// //                 labelText: 'New $fieldToUpdate',
// //               ),
// //             ),
// //             SizedBox(height: 10),
      
// //            ElevatedButton(
// //   onPressed: () {
// // try { log("Profile bio updated successfully");
// //     // Update data in Firestore
// //     FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
// //       "bio": _bioController,
// //     });
  
// // } catch (e) {
// //   throw  Exception("Error updating profile bio: $e");

// // }
    

// //     Navigator.pop(context);
// //   },
// //   child: Text('Save'),
// // ),


// //           ],
// //         ),
// //       );
// //     },
// //   );
// // }

