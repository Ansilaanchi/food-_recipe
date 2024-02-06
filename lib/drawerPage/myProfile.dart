import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:foodie_zone/drawerPage/notification.dart';
import 'package:foodie_zone/drawerPage/profileImage.dart';
import 'package:foodie_zone/drawerPage/textBox.dart';
// import 'package:foodie_zone/services/model/profileData.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  Uint8List? _image;
  File? imageFile;
  File? selectedImage;
  List<File> img = <File>[];

  bool isObscurePassword = true;

  Future<void> editField(String field) async {
  }
  @override
  Widget build(BuildContext context) {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [


        ProfileImage(),

          SizedBox(
            height: 10,
          ),

TextBox(
  text: _nameController.text,
  sectionName: 'name',
  onPressed: () {
    _showSettingsBottomSheet(context, 'name', _nameController.text);
  },
),
TextBox(
  text: _bioController.text,
  sectionName: 'bio',
  onPressed: () {
    _showSettingsBottomSheet(context, 'bio', _bioController.text);
  },
),



        ]
        ),
        
    );
  }



  Widget buidTextFeild(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      // padding: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.all(10),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            // border: OutlineInputBorder(),
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye))
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey,
            )),
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
        });
  }

  void getImage({required ImageSource source}) async {
    final MyFile = await ImagePicker().pickImage(source: source);
    if (MyFile == null) {
      return;
    }

    setState(() {
      img.add(File(MyFile.path));
    });
  }

//gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  //camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}

class _showSettingsBottomSheet {
  _showSettingsBottomSheet(BuildContext context, String text, String );
}

Container ThinDivider() {
  return Container(
    height: 3,
    color: Colors.grey[200],
  );
}
