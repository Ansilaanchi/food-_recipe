class UserRecipe {
  String title;
  List<String> ingredients;
  String instructions;
  String imageUrl;
  String uid;

  UserRecipe({
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.imageUrl,
    required this.uid,
  });

  factory UserRecipe.fromJson(Map<String, dynamic>? json) {
    return UserRecipe(
      title: json?['title'] as String? ?? 'No Title',
      ingredients: (json?['ingredients'] as List<dynamic>?)?.map((ingredient) => ingredient.toString()).toList() ?? [],
      instructions: json?['instructions'] as String? ?? 'No Instructions',
      imageUrl: json?['imageUrl'] as String? ?? '',
      uid: json?['uid'] as String? ?? '',
    );
  }
}

   UserRecipe defaultRecipe() {
    return UserRecipe(
      title: 'Default Title',
      ingredients: [], // Provide default ingredients
      instructions: 'Default Instructions',
      imageUrl: 'default_image_url',
      uid: 'default_uid',
    );
}







// class UserRecipe {
//   String title;
//   List<String> ingredients;
//   String instructions;
//   String imageUrl;
//   // String uid;

//   UserRecipe({
//     required this.title,
//     required this.ingredients,
//     required this.instructions,
//     required this.imageUrl,
//     // required this.uid,
//   });

//   // Add a factory method to create a UserRecipe from JSON data
//   factory UserRecipe.fromJson(Map<String, dynamic> json) {
//     return UserRecipe(
//       title: json['title'],
//       ingredients: List<String>.from(json['ingredients']),
//       instructions: json['instructions'],
//       imageUrl: json['imageUrl'],
//       // uid: json['uid'],
//     );
//   }
// }
