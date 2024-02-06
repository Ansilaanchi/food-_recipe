import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/services/model/userModel.dart';

class ProfileData extends StatefulWidget {
  ProfileData({Key? key});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  // Define variables to store user data
  String profilepic = "";
  String name = "";
  String bio = "";

  @override
  Widget build(BuildContext context) {
    // Get the UID of the currently authenticated user
    String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
                  builder: (
                    context,
                    AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
                  ) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (!snapshot.data!.exists) {
                      return Scaffold(
                        body: Center(
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset("assets/cookiegrl.jpg"),
                                Text('Your Cart is empty'),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      UserModel model = UserModel.getModelFromJson(json: snapshot.data!.data()!);

                      return Scaffold(
                        backgroundColor: Color(0xFFF5F6F9),
                        appBar: AppBar(
                          elevation: 0,
                          centerTitle: true,
                          leading: BackButton(),
                          title: Column(
                            children: [
                              Text(
                                "MY PROFILE",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        body: ListView(
                          children: [
                            Column(
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(model.profilepic),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(model.name),
                                Text(model.bio),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}








// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ProfileData extends StatelessWidget {
//   final String userId; // Your user ID

//   const ProfileData( this.userId);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile '),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('users').doc(userId).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator()); // Show a loading indicator while fetching data
//           }
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Text('No data found!'); // If document doesn't exist
//           }
          
//           // Access and use the data here
//             Map<String, dynamic> data =
//             snapshot.data!.data() as Map<String, dynamic>;

//           return  SingleChildScrollView(
//             child: Container(
//               // height: double.infinity,
//               width: double.infinity,
//               color: Color.fromARGB(255, 238, 244, 247),
//               child: Column(
//                 // verticalDirection: VerticalDirection.down,
//                 children: [
//                   // Text(
//                   //   data["recipeName"] ?? "",
//                   //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   // ),
//                   // SizedBox(
//                   //   height: 5,
//                   // ),
//                   Container(
//                       height: 200,
//                       width: double.infinity,
//                       child: Image.network(
//                         data["image"] ?? "",
//                         fit: BoxFit.cover,
//                       )),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     height: 25,
//                     width: double.infinity,
//                                       // color: const Color.fromARGB(255, 224, 206, 212),
//                         color: Color.fromARGB(255, 238, 244, 247),
            
//                     child: Center(
//                       child: Text(
//                         "bio",
//                         style: TextStyle(fontWeight: FontWeight.w500,),
//                       ),
//                     ),
//                   ),

                      
//                   // Container(
//                   //   height: 250,
//                   //   width: double.infinity,
//                   //               color: Color.fromARGB(255, 238, 244, 247),
//                   //   child: ListView.builder(
//                   //     shrinkWrap: true,
//                   //     itemCount: data["ingredients"].length,
//                   //     itemBuilder: (BuildContext context, int index) {
//                   //       return ListTile(
//                   //         title: Text(data["ingredients"][index].toString()),
//                   //       );
//                   //     },
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 5,
//                   ),
            
                 
//                 ],
//               ),
//             ),
//           );

//         },
//       ),
//     );
//   }
// }