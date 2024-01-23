 import 'package:flutter/material.dart';
import 'package:foodie_zone/HomePage/homePage.dart';
// import 'package:foodie_zone/navigatePages/favourite.dart';
import 'package:foodie_zone/drawerPage/myProfile.dart';
import 'package:foodie_zone/notes/notehome.dart';


Widget Newbarr(BuildContext context) {
    return  Container(
      height: 50,
      // width: 350,
      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)

      ),
      child: NavigationBar(
       destinations : [
      GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Icon(Icons.home),
                  
                ),
                InkWell(
                  onTap: (){
                     Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));                     
                  },
                  child:Icon(Icons.post_add)
                   
                ),
                // GestureDetector(
                //     onTap: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => FavoritePage(favoriteItems: [],)));
                //     },
                //     child: Icon(
                //       Icons.favorite,color: Colors.red,
                //     )),
               GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
                },
                 child:CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage("assets/islamic-pics-for-dp-girl-islamic-dp-images-girl.jpg"),
                  )
                  // Icon(Icons.person)
               )
        ],
      ),
    );
  }

