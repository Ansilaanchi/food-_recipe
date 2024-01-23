import 'package:flutter/material.dart';

class SerachKey extends StatefulWidget {
  const SerachKey({super.key});

  @override
  State<SerachKey> createState() => _SerachKeyState();
}

class _SerachKeyState extends State<SerachKey> {
  @override
  Widget build(BuildContext context) {
    return  Container(
              width: 350,
              height: 50,
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // suffixIcon: Icon(Icons.delete_forever),
                  // label:Icon(Icons.search),

                  hintText: "Search what you want ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            );
  }
}