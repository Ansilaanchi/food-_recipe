import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final String label;
  final int maxLine;

  const TextField({
    Key ? key,
    required this.label,
    required this.maxLine,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        maxLines: maxLine,
        decoration: InputDecoration(
          labelText: label, filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}