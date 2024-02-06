import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_zone/userPlatform/rFormModel.dart';
import 'package:foodie_zone/userPlatform/viewData.dart';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Text("User data not available");
        }

        var userData = snapshot.data!.data();
        var recipesCollection = FirebaseFirestore.instance.collection('users').doc(uid).collection('UserRecipe');

        return Scaffold(
          appBar: AppBar(
            title: Text('Your Recipes'),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: recipesCollection.snapshots(),
            builder: (context, recipesSnapshot) {
              if (!recipesSnapshot.hasData) {
                return CircularProgressIndicator();
              }

              var recipes = recipesSnapshot.data!.docs;

              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  var recipeData = recipes[index].data();
                  if (recipeData != null) {
                    var recipe = UserRecipe.fromJson(recipeData as Map<String, dynamic>);
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: Text(recipe.title),
                        leading: Image.network(recipe.imageUrl),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewData(recipe: recipe),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}



















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie_zone/userPlatform/rFormModel.dart';
// import 'package:foodie_zone/userPlatform/viewData.dart';

// class RecipeList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String? uid = FirebaseAuth.instance.currentUser?.uid;

//     return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//         stream:
//             FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }

//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Text("User data not available");
//           }

//           var userData = snapshot.data!.data();
//           var recipesCollection = FirebaseFirestore.instance
//               .collection('users')
//               .doc(uid)
//               .collection('UserRecipe');

//           return StreamBuilder<QuerySnapshot>(
//               stream: recipesCollection.snapshots(),
//               builder: (context, recipesSnapshot) {
//                 if (!recipesSnapshot.hasData) {
//                   return CircularProgressIndicator();
//                 }

//                 var recipes = recipesSnapshot.data!.docs;

//                 return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Recipes of ${userData!['name']}:'),
//                       // Inside the RecipeList widget, change the stream builder part
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: recipes.length,
//                         itemBuilder: (context, index) {
//                           var recipe = UserRecipe.fromJson(
//                               recipes[index].data() as Map<String, dynamic>);

//                           return Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: ListTile(
//                               title: Text(recipe.title),
//                               leading: Image.network(recipe.imageUrl),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         ViewData(), // This is where you create an instance of ViewData
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                       )
//                     ]);
//               });
//         });
//   }
// }























// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie_zone/userPlatform/rFormModel.dart';
// import 'package:foodie_zone/userPlatform/viewData.dart';

// class RecipeList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String? uid = FirebaseAuth.instance.currentUser?.uid;

//     return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//       stream: FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }

//         if (!snapshot.hasData || !snapshot.data!.exists) {
//           return Text("User data not available");
//         }

//         var userData = snapshot.data!.data();
//         var recipesCollection = FirebaseFirestore.instance.collection('users').doc(uid).collection('UserRecipe');

//         return StreamBuilder<QuerySnapshot>(
//           stream: recipesCollection.snapshots(),
//           builder: (context, recipesSnapshot) {
//             if (!recipesSnapshot.hasData) {
//               return CircularProgressIndicator();
//             }

//             var recipes = recipesSnapshot.data!.docs;

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Recipes of ${userData!['name']}:'),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: recipes.length,
//                   itemBuilder: (context, index) {
//                      UserRecipe model = UserRecipe.getModelFromJson(
//                       json: snapshot.data!.docs[index].data());
//                     var recipe = recipes[index].data() as Map<String, dynamic>;
//                     return Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ListTile(
//                         title: Text(recipe['title']),
                    
//                         leading: Image.network(recipe['imageUrl']),
//                         onTap: (){
//      Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ViewData(model.uid),
//                             )
//      );
//                         },
                        
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }
