import 'package:flutter/material.dart';
import 'package:foodie_zone/userPlatform/rFormModel.dart';

class ViewData extends StatelessWidget {
  final UserRecipe recipe;

  ViewData({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECIPE DETAILS'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            recipe.title.isEmpty ? 'No Title' : recipe.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(recipe.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
  width: double.infinity,
  color: Color.fromARGB(255, 238, 244, 247),
  padding: EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Ingredients:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 5),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (recipe.ingredients ?? []).map((ingredient) {
          return Text(ingredient??''); // Make sure ingredient is not null
        }).toList(),
      ),
    ],
  ),
),

          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 244, 247),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instructions:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  recipe.instructions.isEmpty ? 'No Instructions' : recipe.instructions,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ViewData extends StatelessWidget {
//   ViewData();

//   @override
//   Widget build(BuildContext context) {
//     String? uid = FirebaseAuth.instance.currentUser?.uid;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('RECIPIES '),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Text('No data found!');
//           }

//           // Access and use the data here
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;

//           return ListView(
//             children: [
//               Container(
//                 width: double.infinity,
//                 color: Color.fromARGB(255, 238, 244, 247),
//                 child: Column(
//                   children: [
//                     Text(
//                       data["title"] ?? "",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                     Container(
//   width: double.infinity,
//   height: 200, // Set a fixed height or adjust it accordingly
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(20),
//   ),
//   child: LayoutBuilder(
//     builder: (BuildContext context, BoxConstraints constraints) {
//       return data['imageUrl'] != null
//           ? Image.network(
//               data['imageUrl'],
//               fit: BoxFit.cover,
//               height: constraints.maxHeight, // Use the height from constraints
//             )
//           : Image.asset(
//               'assets/cookiegrl.jpg',
//               fit: BoxFit.cover,
//               height: constraints.maxHeight, // Use the height from constraints
//             );
//     },
//   ),
// ),

//                     // Container(
//                     //   width: double.infinity,
//                     //   decoration: BoxDecoration(
//                     //     borderRadius: BorderRadius.circular(20),
//                     //   ),
//                     //   child: Image.network(
//                     //     data['imageUrl'] ?? 'assets/cookiegrl.jpg',
//                     //     fit: BoxFit.cover,
//                     //   ),
//                     // ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       color: Color.fromARGB(255, 238, 244, 247),
//                       child: Builder(
//                         builder: (BuildContext context) {
//                           dynamic ingredientsData = data["ingredients"];
//                           print(
//                               "Type of ingredientsData: ${ingredientsData.runtimeType}");
//                           print(
//                               "Length of ingredientsData: ${ingredientsData?.toString()}");

//                           return ListView(
//                             children: [
//                               ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount:
//                                     (ingredientsData as List<dynamic>?)?.length ??
//                                         0,
//                                 itemBuilder:
//                                     (BuildContext context, int index) {
//                                   String ingredient = (ingredientsData
//                                               as List<dynamic>?)?[index]
//                                           ?.toString() ??
//                                       "";
//                                   return ListTile(
//                                     title: Text(ingredient),
//                                   );
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       height: 25,
//                       width: double.infinity,
//                       color: Color.fromARGB(255, 238, 244, 247),
//                       child: Center(
//                         child: Text(
//                           "INSTRUCTIONS",
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       color: Color.fromARGB(255, 238, 244, 247),
//                       child: Text(data["instructions"] ?? ""),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
