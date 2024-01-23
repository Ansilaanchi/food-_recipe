import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['Student', 'House Wife' ,'Professoins', ];


class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: DropdownButtonExample(),
      );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
                  width: 350,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down_outlined),
        elevation: 0,
        style: const TextStyle(color: Colors.grey),
        
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
