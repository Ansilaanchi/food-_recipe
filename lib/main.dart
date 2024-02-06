// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie_zone/HomePage/homePage.dart';
// import 'package:foodie_zone/introPage/page1.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize SharedPreferences
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//   await Firebase.initializeApp();

//   runApp(MyApp(isLoggedIn: isLoggedIn));
// }

// class MyApp extends StatefulWidget {
//   final bool isLoggedIn;

//   const MyApp({required this.isLoggedIn, super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: widget.isLoggedIn ? HomePage() : IntroPage(),
//       // home: HomePage(),
//     );
//   }
// }



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/HomePage/homePage.dart';
import 'package:foodie_zone/introPage/page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  await Firebase.initializeApp();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;

  const MyApp({required this.isLoggedIn, Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          // Intercept back button press
          if (!widget.isLoggedIn) {
            // If not logged in, prevent navigating back
            return false;
          } else {
            // If logged in, allow navigating back
            return true;
          }
        },
        child: widget.isLoggedIn ? IntroPage() : HomePage(),
      ),
    );
  }
}
