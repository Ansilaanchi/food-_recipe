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
  // bool _isLoading = false;

  // final TextEditingController recipeNameController = TextEditingController();
  // final TextEditingController ingredientsController = TextEditingController();
  // final TextEditingController instructionsController = TextEditingController();
  // final TextEditingController titleController = TextEditingController();
  //   final TextEditingController imageController = TextEditingController();

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
                            .collection("recipe")
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

                                    //         return ListTile(
                                    //           leading:CircleAvatar(
                                    //   radius: 30,
                                    //   backgroundImage: NetworkImage(
                                    //     model.image
                                    //       ),
                                    // ),

                                    //           title: Text(model.recipeName),
                                    //           subtitle: Text(model.instructions[index]),

                                    //         );
                                  }),
                            );
                          }
                        },
                      )
                    ])))));

    // Center(
    //     child: Text(
    //   title,
    //   // "INGREDIENTS (Us Cup = 240ml)",
    //   style: TextStyle(
    //     color: Colors.black,
    //     fontSize: 20,
    //     fontWeight: FontWeight.bold,
    //   ),
    // )),
    // SizedBox(
    //   height: 20,
    // ),

    // Container(
    //   height: 250,
    //   width: 400,
    //   decoration: BoxDecoration(
    //       ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         ingredients,
    //         style: TextStyle(
    //             color: Color.fromARGB(255, 17, 3, 58),
    //             fontSize: 18),
    //       ),
    //       Text(
    //         ingredients,
    //         style: TextStyle(
    //             color: Color.fromARGB(255, 17, 3, 58),
    //             fontSize: 18),
    //       ),
    //       Text(
    //         ingredients,
    //         style: TextStyle(
    //             color: Color.fromARGB(255, 17, 3, 58),
    //             fontSize: 18),
    //       ),
    //       Text(
    //         ingredients,
    //         style: TextStyle(
    //             color: Color.fromARGB(255, 17, 3, 58),
    //             fontSize: 18),
    //       ),
    //       Text(
    //         ingredients,
    //         style: TextStyle(
    //             color: Color.fromARGB(255, 17, 3, 58),
    //             fontSize: 18),
    //       ),

    //     ],
    //   ),
    // ),
    // Container(
    //   width: MediaQuery.sizeOf(context).width,
    //   decoration: BoxDecoration(
    //       ),
    //   child: Column(
    //     children: [
    //       Text(
    //         instructions,
    //         style: TextStyle(
    //             fontSize: 25,
    //             color: Colors.black,
    //             fontWeight: FontWeight.bold),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(5.0),
    //         child: Text(instructions),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(5.0),
    //         child: Text(instructions),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(5.0),
    //         child: Text(instructions),
    //       ),
    //       Text(instructions),

    //       Text(instructions),

    //     ],
    //   ),
    // ),
  }
}

/////////
// Text("  * 2 Cups Atta ", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
//                 Text("  * 3/4 cup warm water (or hot water, 2 to 4 tbsps more as required read notes) ", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
//                 Text("  * 1/4 teaspoon salt (optional)", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
//                 Text("  * 1 to 1 1/2 tablespoons oil (optional, read notes )", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
//                 Text("  * 2 to 2 1/2 tablespoons ghee or oil ", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),

//////////

//  Text("Add two cups of wheat flour to a bowl, add a pinch of salt and mix everything. Add two tablespoons of yoghurt and mix everything."),
//             )  ,
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Text("Adding yoghurt makes the chapatis softer and they stay soft for long period of time"),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Text("Finally add a teaspoon of oil, knead again and make a soft, non-sticky dough.Cling wrap it and rest the dough for about 30 minutes.\n Now make small balls and dust them with some flour.Add some flour to your rolling surface.Roll them into thin circles using a rolling pin."),
//             ),
//             Text("Take a skillet and heat it. Place the rolled chapathi on the skillet and when you see small bubbles appearing apply a little oil on it.Cook them for a few secondsFlip and cook on other side, too. Also apply a few drops of oil on other side."),

//             Text("Enjoy the Chapatis With Any Curry..."),
/////////

//  SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(30.0),
//                         ),
//                         primary: Colors.orangeAccent,
//                         padding:
//                         EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                         textStyle: TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold)),
//                       onPressed: () {

//                         RecipeMethods().recipeUser(recipeName: recipeName, ingredients: ingredients, instructions: instructions, image: "");
//                       },
//                       child: Text(
//                         'Save my recipe',
//                       ),
//                     ),
//                   )

/////////
///

class FirebaseDataScreen extends StatelessWidget {
  final String recipeId; // Your user ID

  FirebaseDataScreen(this.recipeId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECIPIES '),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('recipe').doc(recipeId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Show a loading indicator while fetching data
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
