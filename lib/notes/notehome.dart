import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodie_zone/notes/boxes.dart';
import 'package:foodie_zone/notes/notemodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  List<Color> colors = [Colors.purple, Colors.black38, Colors.green, Colors.blue, Colors.red];
  Random random = Random();

    late Box<NotesModel> notesBox;
 @override
  void initState() {
    super.initState();
    // openBox();
  }

  // void openBox() async {
  //   notesBox = await Boxes.openNotesBox();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Database'),
      ),
      body: ValueListenableBuilder<Box<NotesModel>>(
  valueListenable: Boxes.getNotesBox().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<NotesModel>();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              itemCount: data.length,
              reverse: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    color: colors[random.nextInt(4)],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                data[index].title,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  delete(data[index]);
                                },
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                              SizedBox(width: 15,),
                              InkWell(
                                onTap: () {
                                  _editDialog(data[index]);
                                },
                                child: Icon(Icons.edit, color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            data[index].description,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showMyDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void delete(NotesModel notesModel) async {
    await notesModel.delete();
  }

  Future<void> _editDialog(NotesModel notesModel) async {
    titleController.text = notesModel.title;
    descriptionController.text = notesModel.description;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit NOTES'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                notesModel.title = titleController.text;
                notesModel.description = descriptionController.text;

                await notesModel.save();
                descriptionController.clear();
                titleController.clear();

                Navigator.pop(context);
              },
              child: Text('Edit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add NOTES'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final data = NotesModel(title: titleController.text, description: descriptionController.text);
                final box = Boxes.getNotesBox();
                await box.add(data);

                titleController.clear();
                descriptionController.clear();

                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}












////////////////////////////////////////////////////////////////////////////////////


// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:foodie_zone/notes/boxes.dart';
// import 'package:foodie_zone/notes/notemodel.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final titleController = TextEditingController();
//   final descriptionController = TextEditingController();

//   List<Color> colors = [Colors.purple, Colors.black38, Colors.green, Colors.blue, Colors.red];
//   Random random = Random();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hive Database'),
//       ),
//       body: ValueListenableBuilder<Box<dynamic>>(
//         valueListenable: Boxes.getNotesBox().listenable(),
//         builder: (context, box, _) {
//           var data = box.values.toList().cast<NotesModel>();
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: ListView.builder(
//               itemCount: data.length,
//               reverse: true,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: Card(
//                     color: colors[random.nextInt(4)],
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 data[index].title,
//                                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
//                               ),
//                               Spacer(),
//                               InkWell(
//                                 onTap: () {
//                                   delete(data[index]);
//                                 },
//                                 child: Icon(Icons.delete, color: Colors.white),
//                               ),
//                               SizedBox(width: 15,),
//                               InkWell(
//                                 onTap: () {
//                                   _editDialog(data[index], data[index].title, data[index].description);
//                                 },
//                                 child: Icon(Icons.edit, color: Colors.white),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             data[index].description,
//                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           _showMyDialog();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void delete(NotesModel notesModel) async {
//     await notesModel.delete();
//   }

//   Future<void> _editDialog(NotesModel notesModel, String title, String description) async {
//     titleController.text = title;
//     descriptionController.text = description;

//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit NOTES'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: titleController,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter title',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 TextFormField(
//                   controller: descriptionController,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter description',
//                     border: OutlineInputBorder(),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 notesModel.title = titleController.text.toString();
//                 notesModel.description = descriptionController.text.toString();

//                 notesModel.save();
//                 descriptionController.clear();
//                 titleController.clear();

//                 Navigator.pop(context);
//               },
//               child: Text('Edit'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _showMyDialog() async {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add NOTES'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: titleController,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter title',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 TextFormField(
//                   controller: descriptionController,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter description',
//                     border: OutlineInputBorder(),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 final data = NotesModel(title: titleController.text, description: descriptionController.text);
//                 final box = Boxes.getNotesBox();
//                 box.add(data);

//                 titleController.clear();
//                 descriptionController.clear();

//                 Navigator.pop(context);
//               },
//               child: Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

/////////////////////////////////////////////////////////////////


// import 'package:flutter/material.dart';
// import 'package:foodie_zone/notes/createnote.dart';
// import 'package:foodie_zone/notes/notecard.dart';
// import 'package:foodie_zone/notes/notemodel.dart';
// import 'package:foodie_zone/notes/noteview.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class NoteScreen extends StatefulWidget {
//   const NoteScreen({
//     super.key});

 
//   @override

//   State<NoteScreen> createState() => _NoteScreenState();
// }

// class _NoteScreenState extends State<NoteScreen> {

//   // List<Note> notes = List.empty(growable: true);
//   late Box<Note> notesBox;
//   late Future<void> boxFuture; // Store the future for opening the box

// void initState() {
//     super.initState();
//     boxFuture = openBox(); // Assign the future to boxFuture
//   }

// Future<void> openBox() async {
//   try {
//     notesBox = await Hive.openBox<Note>('notes');
//     print('Box opened successfully: ${notesBox.path}');
//   } catch (e) {
//     print('Error opening box: $e');
//   }
// }


// void saveNote(Note note) {
//   try {
//     notesBox.add(note);
//   } catch (e) {
//     print('Error saving note: $e');
//   }
// }


//   List<Note> getNotes() {
//     return notesBox.values.toList();
//   }

//   void onNewNoteCreated(Note note) {
//   print('New note created: $note');
//   saveNote(note);
//   print('Notes in Box: ${getNotes()}');
//   setState(() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CreateNote(
//           onNewNoteCreated: onNewNoteCreated,
//         ),
//       ),
//     );
//   });
// }


//   void onNoteDeleted(int index) {
//     notesBox.deleteAt(index);
//     setState(() {
//       Navigator.of(context).push(
//   MaterialPageRoute(
//     builder: (context) => NoteView(
//       note: getNotes()[index],  // Pass the note to be viewed
//       index: index,
//       onNoteDeleted: onNoteDeleted,
//     ),
//   ),
// );

//     });
//   }

//   @override
//     Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text("My Notes", style: TextStyle(fontWeight: FontWeight.w500),),
//     ),
//      body: FutureBuilder(
//         future: boxFuture,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//   return Text('Error: ${snapshot.error}');
// }
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListView.builder(
//               itemCount: getNotes().length,
//               itemBuilder: (context, index) {
//                 return NoteCard(
//                   note: getNotes()[index],
//                   index: index,
//                   onNoteDeleted: onNoteDeleted,
//                 );
//               },
//             );
//           } else {
//                         return CircularProgressIndicator();
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // saveNote();
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => CreateNote(
//                 onNewNoteCreated: onNewNoteCreated,
//               ),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("My Notes", style: TextStyle(fontWeight:FontWeight.w500),),
  //     ),

  //     body: ListView.builder(
  //       itemCount: notes.length,
  //       itemBuilder: (context, index){
  //         return NoteCard(note: notes[index], index: index, onNoteDeleted:onNoteDeleted);
  //       },
  //     ),

  //     floatingActionButton: FloatingActionButton(
  //       onPressed: (){
  //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateNote(onNewNoteCreated: onNewNoteCreated,)));
  //       },
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }

