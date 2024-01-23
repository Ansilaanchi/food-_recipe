










import 'package:flutter/material.dart';

/// Flutter code sample for [AlertDialog].

void main() => runApp(const AlertDialogExampleApp());

class AlertDialogExampleApp extends StatelessWidget {
  const AlertDialogExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AlertDialog Sample')),
        body: const Center(
          child: DialogExample(),
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}


// import 'dart:io';
// import 'dart:typed_data';
// // import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Uint8List? _image;
//   File? imageFile;
//   File? selectedImage;
//   List<File> img = <File>[];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//           height: 60,
//           backgroundColor: Colors.white,
//           destinations: [
//             IconButton(
//                 onPressed: () {
//                   showImagePickerOption(context);
//                 },
//                 icon: Icon(Icons.search)),
//             IconButton(
//                 onPressed: () {
//                   getImage(source: ImageSource.gallery);
//                   // _pickImageFromGallery();
//                 },
//                 icon: Icon(Icons.photo_library_outlined)),
//             IconButton(
//                 onPressed: () {
//                   getImage(source: ImageSource.camera);

                
//                 },
//                 icon: Icon(
//                   Icons.camera_alt_outlined,
//                   size: 50,
//                 )),
//             IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
//             IconButton(onPressed: () {}, icon: Icon(Icons.person)),
//           ]),
//       body: ListView(
//         children: [
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               CircleAvatar(
//                 radius: 20,
//                 child: Icon(
//                   Icons.bolt_outlined,
//                 ),
//               ),
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: AssetImage("assets/PaulWalker.jpg"),
//               ),
//               CircleAvatar(
//                 radius: 20,
//                 child: Icon(
//                   Icons.create_sharp,
//                 ),
//               ),
//             ],
//           ),
//           const Center(
//             child: Text(
//               "Paul Walker",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const Center(
//               child: Text(
//             "Be happy..",
//             style: TextStyle(
//               fontSize: 18,
//             ),
//           )),
//           const SizedBox(
//             height: 20,
//           ),
//           const ThinDivider(),
//           const SizedBox(
//             height: 20,
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "264",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Photos",
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "45k",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Followers",
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "213",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Following",
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
          
//           Padding(
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

//         ],
//       ),
//     );
//   }

//   void showImagePickerOption(BuildContext context) {
//     showModalBottomSheet(
//         backgroundColor: const Color.fromARGB(255, 199, 223, 243),
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
//                     onTap: () {},
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
//                     onTap: () {},
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

//   void getImage({required ImageSource source}) async {
//     final MyFile = await ImagePicker().pickImage(source: source);
//     if (MyFile == null) {
//       return;
//     }

//     setState(() {
//       img.add(File(MyFile.path));
//     });
//   }

//   // void getImage() async {
//   //   final file1 = await ImagePicker().pickImage(source: ImageSource.camera);

//   //   if (file1 == null) {
//   //     return;
//   //   }
//   //   setState(() {
//   //     imageFile = File(file1.path);
//   //   });
//   // }

//   Future _pickImageFromGallery() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) return;
//     setState(() {
//       selectedImage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });
//   }
// }

// class ThinDivider extends StatelessWidget {
//   const ThinDivider({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 3,
//       color: Colors.grey[200],
//     );
//   }
// }
