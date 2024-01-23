import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:foodie_zone/drawerPage/notification.dart';
import 'package:foodie_zone/drawerPage/profileImage.dart';
import 'package:foodie_zone/drawerPage/textBox.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Uint8List? _image;
  File? imageFile;
  File? selectedImage;
  List<File> img = <File>[];

  bool isObscurePassword = true;

  Future<void> editField(String field) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      
      body: ListView(
        children: [
          // Stack(
          //   children: [
          //     _image != null
          //         ? Center(
          //             child: CircleAvatar(
          //               radius: 100,
          //               backgroundImage: MemoryImage(_image!),
          //             ),
          //           )
          //         : Center(
          //             child: CircleAvatar(
          //               radius: 100,
          //               backgroundImage: AssetImage(
          //                   "assets/islamic-pics-for-dp-girl-islamic-dp-images-girl.jpg"),
          //             ),
          //           ),
          //     Positioned(
          //         right: 90,
          //         bottom: 4,
          //         child: IconButton(
          //             onPressed: () {
          //               showImagePickerOption(context);
          //             },
          //             icon: Icon(Icons.add_a_photo, size: 30,)))
          //   ],
          // ),


ProfileImage( 
  
),

          SizedBox(
            height: 100,
          ),

// uensame
  TextBox(
  text: 'ur name',
  sectionName: 'name',
  onPressed: () {
    showSettingsBottomSheet(context, 'users', 'name', 'ur name');
  },
),

//bio

TextBox(
  text: 'Some bio',
  sectionName: 'bio',
  onPressed: () {
    oneshowSettingsBottomSheet(context, 'users', 'bio', 'Some bio');
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
}

Container ThinDivider() {
  return Container(
    height: 3,
    color: Colors.grey[200],
  );
}

//   const Center(
//     child: Text(
//       "Aysha Qasim",
//       style: TextStyle(
//         fontSize: 25,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
//   const Center(
//       child: Text(
//     "Its mY paSsiOn..!",
//     style: TextStyle(
//       fontSize: 18,
//     ),
//   )),
//   const SizedBox(
//     height: 20,
//   ),
// ThinDivider(),
//   const SizedBox(
//     height: 20,
//   ),
// const Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Column(
//       children: [
//         Text(
//           "264",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           "Photos",
//           style: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),
//     Column(
//       children: [
//         Text(
//           "45k",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           "Followers",
//           style: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),
//     Column(
//       children: [
//         Text(
//           "213",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           "Following",
//           style: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),

//   ],
// ),
//  ThinDivider(),

//  Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//                 width: 300,
//                 child: GridView.builder(
//                     physics: ScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: img.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisSpacing: 5,
//                         mainAxisSpacing: 5,
//                         crossAxisCount: 3),
//                     itemBuilder: (context, index) {
//                       return Container(
//                           width: 100,
//                           height: 100,
//                           child: Image.file(
//                             img[index],
//                             fit: BoxFit.cover,
//                           ));
//                     })),
//           ),
//           Row(
//             children: [
//               if (imageFile != null)
//                 Container(
//                   width: 150,
//                   height: 150,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: FileImage(imageFile!), fit: BoxFit.cover)),
//                 )
//               else
//                 Container(
//                   width: 150,
//                   height: 150,
//                   decoration:
//                       BoxDecoration(color: Color.fromARGB(255, 255, 254, 249)),
//                 ),
//             ],
//           ),
