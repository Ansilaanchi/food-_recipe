import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  final String id;
  final String recipeName;
  final String image;
  final List<String> ingredients;
  final String instructions;
//  final String uid;

  RecipeModel( {
 required  this.id,
    required this.recipeName,
    required this.image,
    required this.ingredients,
    required this.instructions,
    //  required this.uid,

     
  });

    



  Map<String, dynamic> toJson() => {
    "id":id,
        "recipeName": recipeName,
        "ingredients": ingredients,
        "preparations": instructions,
        "image": image,
          //  "uid":uid ,
      };

  static RecipeModel? fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return RecipeModel(
      id:snapshot['id'] ,
      recipeName: snapshot['recipeName'],
      ingredients: List<String>.from(snapshot['ingredients']),
      instructions: snapshot['instructions'],
      image: snapshot['image'],
      //  uid: '',
      //  uid: snapshot['uid'],
    );
  }

  factory RecipeModel.getModelFromJson({required Map<String, dynamic> json}) {
    return RecipeModel(
      id: json["id"],
      recipeName: json['recipeName'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: json['instructions'],
      image: json['image'],
        // uid: json['uid'],
    );
  }
}



