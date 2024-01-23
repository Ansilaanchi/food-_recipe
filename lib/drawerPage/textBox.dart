import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_zone/services/model/userModel.dart';



// ignore: must_be_immutable
class TextBox extends StatefulWidget {
  final String text;
  final String sectionName;
  void Function()? onPressed;
   TextBox({super.key, required this.text, required this.sectionName,required this.onPressed});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.only(left: 15, bottom: 15),
      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.sectionName,style: TextStyle(color: Colors.grey[500]),),
              IconButton(onPressed: widget.onPressed,
    icon: Icon(Icons.settings),color: Colors.grey[400],)
            ],
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}

void showSettingsBottomSheet(BuildContext context, String documentId, String fieldToUpdate, String initialValue) {
  TextEditingController _namecontroller = TextEditingController(text: initialValue);

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
              controller: _namecontroller,
              decoration: InputDecoration(
                labelText: 'New $fieldToUpdate',
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
  onPressed: ()async{
    try {
      // Update data in Firestore
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
        "name": _namecontroller.text,
      });
      log("Profile name updated successfully");
   
    
      // Call setState with a callback function to trigger a rebuild
      // setState(() {
        
      //   // Your additional code inside setState
      //   // (if needed, such as updating local variables)
      // });

    } catch (e) {
      throw Exception("Error updating profile name: $e");
    }
    Navigator.pop(context);

    // UserModel model = UserModel.getModelFromJson(
                        // json: json.data!.docs.data());
  },
  
  child: Text('Save'),
),

          ],
        ),
      );
    },
  );
}

void oneshowSettingsBottomSheet(BuildContext context, String documentId, String fieldToUpdate, String initialValue) {
  TextEditingController _biocontroller = TextEditingController(text: initialValue);

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
              controller: _biocontroller,
              decoration: InputDecoration(
                labelText: 'New $fieldToUpdate',
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
  onPressed: ()async{
    try {
      // Update data in Firestore
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
        "bio": _biocontroller.text,
      });
      log("Profile bio updated successfully");
    

    } catch (e) {
      throw Exception("Error updating profile bio: $e");
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


// void oneshowSettingsBottomSheet(BuildContext context, String documentId, String fieldToUpdate, String initialValue) {
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
      
//            ElevatedButton(
//   onPressed: () {
// try { log("Profile bio updated successfully");
//     // Update data in Firestore
//     FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
//       "bio": _bioController,
//     });
  
// } catch (e) {
//   throw  Exception("Error updating profile bio: $e");

// }
    

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

