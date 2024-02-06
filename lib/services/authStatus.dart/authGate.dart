// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie_zone/HomePage/homePage.dart';
// import 'package:foodie_zone/registerPage/page3.dart';
// import 'package:foodie_zone/services/authStatus.dart/loginOrRegister.dart';

// class AuthGate extends StatefulWidget {
//   const AuthGate({super.key});

//   @override
//   State<AuthGate> createState() => _AuthGateState();
// }

// class _AuthGateState extends State<AuthGate> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//          builder: (context, snapshot){
//           //user is logged in 
//           if (snapshot.hasData) {
//             return HomePage();
//           }

//         // user is Not logged in 
//         else{
//           return LoginOrRegister();
//         }
//          }
//          ),
//     );
//   }
// }