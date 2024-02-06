import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/services/model/recipe.model.dart';
// import 'package:foodie_zone/services/authStatus.dart/recipeMethod.dart';

class RecipePage extends StatefulWidget {
  RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  // final _formKey = GlobalKey<FormState>();
  String recipeName = "";
  String image = "";
  String title = "";
  String ingredients = "";
  String instructions = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Image.asset('assets/360_F_284468940_1bg6BwgOfjCnE3W0wkMVMVqddJgtMynE.jpg').color,
        appBar: AppBar(
          title: Text(
            recipeName,
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    height: MediaQuery.sizeOf(context).height,
                    // height:MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/brown-backgrounds-15181888.webp"),
                          fit: BoxFit.cover),
                      // image: DecorationImage(image: AssetImage("assets/HD-wallpaper-cute-chef-pretty-food-flour-cute-chef-dough-girl-rolling-pastry-bowl.jpg"),fit: BoxFit.cover),
                    ),
                    child: Column(children: [
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("dinner")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.data!.docs.isEmpty) {
                            return Scaffold(
                              body: Center(
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
                                      "RECIPIES",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              body: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    RecipeModel model =
                                        RecipeModel.getModelFromJson(
                                            json: snapshot.data!.docs[index]
                                                .data());

                                    return Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              NetworkImage(model.image),
                                        ),
                                        Text(model.recipeName),
                                        Text(model.ingredients[index]),
                                        Text(model.instructions),
                                      ],
                                    );
                                  }),
                            );
                          }
                        },
                      )
                    ])))));
  }
}

class LunchData extends StatelessWidget {
  final String recipeId; // Your user ID

  LunchData(this.recipeId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECIPIES '),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('lunch').doc(recipeId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show a loading indicator while fetching data
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Text('No data found!'); // If document doesn't exist
          }

          // Access and use the data here
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return  SingleChildScrollView(
            child: Container(
              // height: double.infinity,
              width: double.infinity,
              color: Color.fromARGB(255, 238, 244, 247),
              child: Column(
                // verticalDirection: VerticalDirection.down,
                children: [
                  Text(
                    data["recipeName"] ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        data["image"] ?? "",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 25,
                    width: double.infinity,
                                      // color: const Color.fromARGB(255, 224, 206, 212),
                        color: Color.fromARGB(255, 238, 244, 247),
            
                    child: Center(
                      child: Text(
                        "INGREDIENTS",
                        style: TextStyle(fontWeight: FontWeight.w500,),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                                color: Color.fromARGB(255, 238, 244, 247),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data["ingredients"].length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(data["ingredients"][index].toString()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
            
                  Container(
                      height: 25,
                    width: double.infinity,
                            //  color: Color.fromARGB(255, 222, 215, 228),
                        color: Color.fromARGB(255, 238, 244, 247),
            
                    child: Center(
                      child: Text(
                        "INSTRUCTIONS",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,                           
                            //  color: Color.fromARGB(255, 222, 215, 228),
                        color: Color.fromARGB(255, 238, 244, 247),
            
                    child: Text(data["instructions"] ?? "")),
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}
