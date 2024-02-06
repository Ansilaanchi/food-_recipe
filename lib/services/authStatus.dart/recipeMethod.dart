
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_zone/services/model/recipe.model.dart';


class RecipeMethods {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<String> recipeUser({
  required String? recipeName,
  required List<String?>? ingredients, // Change List<String?> to List<String?>?
  required String? instructions,
  required String? image,
}) async {
  RecipeModel recipeModel = RecipeModel(
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    recipeName: recipeName ?? "",
    image: image ?? "",
    ingredients: ingredients?.whereType<String>().toList() ?? <String>[], // Filter and convert to List<String>
    instructions: instructions ?? "",
    // uid: _auth.currentUser?.uid ?? "", // You need to provide a UID for the recipe
  );

  await _firestore.collection('recipe').doc(recipeModel.id)
        .set(recipeModel.toJson()
  );

  return "true";
}
}