import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/services/model/recipe.model.dart';
import 'package:foodie_zone/services/model/viewAllData.dart';

class SeeAll extends StatefulWidget {
   const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  final String userId = "";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("vieAll").snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return Scaffold(
            body:
             Center(
                child: Container(
                    child: Column(
              children: [
                Image.asset("assets/cookiegrl.jpg"),
                Text('Your Cart is empty'),
              ],
            ))),
          );
        } else {
          return Scaffold(
            backgroundColor: Color(0xFFF5F6F9),
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              leading: BackButton(),

              title: Column(
                children: [
                  Text(
                    "Are You Surprized !",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10 ) , 
              itemCount:  snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                  RecipeModel model = RecipeModel.getModelFromJson(
                      json: snapshot.data!.docs[index].data());
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllData(model.id)         
                              ));
                    },
                    child: Container(
                       height: 150,width: 150,
                      decoration: BoxDecoration(
                       image:DecorationImage(image:  NetworkImage(
                                   model.image
                                  ), fit: BoxFit.cover) 
                    ),
                    child: Text(model.recipeName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                    ),
                  );
//                 
              }
              ),   
          );
        }
      },
    );
  }
}
