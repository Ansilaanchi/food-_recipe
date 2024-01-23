import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/HomePage/homePage.dart';
import 'package:foodie_zone/registerPage/page2.dart';

class AuthPath extends StatelessWidget {
  const AuthPath({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder:(BuildContext context, AsyncSnapshot <User?> snapshot){
        if (snapshot.connectionState== ConnectionState.waiting) {
          return CircularProgressIndicator();
        }else{
          if (snapshot.hasData) {
            //user is logged in , navigate to the homepage
            return HomePage();
          }
          else{
            //user is logged in, navigate to the login page
            return LoginPage();
          }
        }
      },
      ),
    );
  }
}