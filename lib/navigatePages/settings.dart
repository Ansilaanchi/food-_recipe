import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

void onSearchTextChanged(String searchText) {
    setState(() {
      // recipe = recipe
      //     .where((note) =>
      //         note.content.toLowerCase().contains(searchText.toLowerCase()) ||
      //         note.title.toLowerCase().contains(searchText.toLowerCase()))
      //     .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: SafeArea(child: ListView(
        children: [
          Column(children: [
               Container(
              width: 350,
              height: 50,
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),


              child:TextField(
              onChanged: onSearchTextChanged,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: "Search notes...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                fillColor: Colors.grey.shade800,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ) ,
              // child: const TextField(
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     // suffixIcon: Icon(Icons.delete_forever),
              //     // label:Icon(Icons.search),

              //     hintText: "Search what you want ",
              //     hintStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 15,
              //     ),
              //   ),
              // ),
            ),
            const SizedBox(
              height: 25,
            ),

          ],)
        ],
      )),
    );
  }
}