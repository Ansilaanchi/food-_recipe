import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:foodie_zone/HomePage/homePage.dart';
import 'package:foodie_zone/drawerPage/about.dart';
import 'package:foodie_zone/drawerPage/blank.dart';
import 'package:foodie_zone/drawerPage/myProfile.dart';
import 'package:foodie_zone/registerPage/page2.dart';
// import 'package:foodie_zone/registerPage/page3.dart';
import 'package:foodie_zone/services/AuthMethod.dart';

final AuthMethods  _authService = AuthMethods();


  Widget DrawerPage(BuildContext context) {

    void logOut(){

      final _auth = AuthMethods();
      _auth.signOut();
    }


    return  Drawer(
  child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 168, 168),
              ),
              arrowColor: const Color.fromARGB(255, 230, 227, 221),
              accountName: Text(
                'Aysha_Qasim',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text('aysha1234@gmail',
                  style: TextStyle(color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                 backgroundImage: AssetImage(
                    "assets/islamic-pics-for-dp-girl-islamic-dp-images-girl.jpg"),
                radius: 60,
                //  child: Image(image: AssetImage("assets/islamic-pics-for-dp-girl-islamic-dp-images-girl.jpg")
                //  ),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 235, 168, 168),
              child: ListTile(
                hoverColor: Colors.lightGreen,
                title: Text('My Account'),
                leading: Icon(Icons.login),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (v) {
                    return MyProfile();
                  }));
                },
              ),
            ),
            Card(
              color: Color.fromARGB(255, 235, 168, 168),
              child: ListTile(
                hoverColor: Colors.lightGreen,
                title: Text('Recipes'),
                leading: Icon(Icons.login),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (v) {
                    return recipe();
                  }));
                },
              ),
            ),
            Card(
              color: Color.fromARGB(255, 235, 168, 168),
              child: ListTile(
                hoverColor: Colors.lightGreen,
                title: Text('logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                logOut();
                {       
     FirebaseAuth.instance.signOut();             
     Navigator.of(context).pushReplacement(
                      
     MaterialPageRoute(builder: ((context) =>LoginPage())));
}
                },
              ),
            ),
            Card(
              color: Color.fromARGB(255, 235, 168, 168),
              child: ListTile(
                hoverColor: Colors.lightGreen,
                title: Text('ABOUT'),
                leading: Icon(Icons.info_outline),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
              )
            ),
          ],
        ),
);
  }
