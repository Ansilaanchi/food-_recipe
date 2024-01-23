import 'package:flutter/material.dart';
import 'package:foodie_zone/navigatePages/postSelect.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ListView(
        children: [
          Center(
            child:IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PostSelection()));
            }, icon:  Icon(Icons.camera_alt),)
          ),
          
        ],
      )
    );
  }
}