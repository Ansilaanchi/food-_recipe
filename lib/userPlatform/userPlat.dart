import 'package:flutter/material.dart';
import 'package:foodie_zone/userPlatform/recipeList.dart';
// import 'recipe_list.dart'; // Assuming you have a separate file for RecipeList

class UserPlatform extends StatefulWidget {
  const UserPlatform({Key? key}) : super(key: key);

  @override
  State<UserPlatform> createState() => _UserPlatformState();
}

class _UserPlatformState extends State<UserPlatform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Recipes'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RecipeList(),
            
            
          ),
        ],
      ),
    );
  }
}
