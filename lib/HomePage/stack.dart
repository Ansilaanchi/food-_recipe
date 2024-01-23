import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/services/model/recipe.model.dart';
import 'package:foodie_zone/services/model/stackData.dart';




class StackColumn extends StatefulWidget {
   const StackColumn({super.key});

  @override
  State<StackColumn> createState() => _StackColumnState();
}

class _StackColumnState extends State<StackColumn> {
  final String userId = ""; 


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("stackColumn").snapshots(),
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
                 
                ],
              ),
            ),
            body: ListView.builder(
                itemCount:  snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                    RecipeModel model = RecipeModel.getModelFromJson(
                        json: snapshot.data!.docs[index].data());
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StackData(model.id)         
                                ));
                      },
                      child: Container(
                         height: 150,width: 150,
                        decoration: BoxDecoration(
                        //  image:DecorationImage(image:  NetworkImage(
                        //              model.image
                        //             ), fit: BoxFit.cover) 
                      ),
                      // child: Text("Click here !"),
                      child: Text(model.recipeName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),),
                      ),
                    );
              //                 
                }
                ),

            );
       }}     );
        }
    } 
