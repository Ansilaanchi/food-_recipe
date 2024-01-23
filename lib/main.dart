import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/HomePage/homePage.dart';
import 'package:foodie_zone/notes/notemodel.dart';
// import 'package:foodie_zone/HomePage/homePage.dart';
// import 'package:foodie_zone/introPage/page1.dart';
import 'package:hive_flutter/hive_flutter.dart';



Future<void> main()async{
   WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  
   await Hive.openBox('notes'); // Open your box here

  await Firebase.initializeApp();

  // Perform operations with the box
  // ...


  runApp(const MyApp());    
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

// home: IntroPage(),
// home: LoginPage(),
  home: HomePage(),
    );
  }
}
