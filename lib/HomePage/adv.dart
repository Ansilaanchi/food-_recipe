import 'package:flutter/material.dart';

class AdvPost extends StatefulWidget {
  const AdvPost({super.key});

  @override
  State<AdvPost> createState() => _AdvPostState();
}

class _AdvPostState extends State<AdvPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Stack(
  children: [
    Container(
      height: 200, width: double.infinity,
    decoration: BoxDecoration(
            color: Color.fromARGB(255, 240, 232, 232),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text("What are you \n cooking \n today..?", style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),),
    ),
    Positioned(
      left: 200,right: 10,
      
      child: Container( height: 250, width: 180,
        child: Image(image: AssetImage("assets/bach2fd.jpg")))),
  ],
),

    );
  }
}