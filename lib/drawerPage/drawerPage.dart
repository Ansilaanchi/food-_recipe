import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_zone/drawerPage/about.dart';
import 'package:foodie_zone/drawerPage/myProfile.dart';
import 'package:foodie_zone/registerPage/page2.dart';
import 'package:foodie_zone/services/AuthMethod.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final AuthMethods _authService = AuthMethods();

String? profilePicUrl;

@override
void initState() {
  super.initState();
  // Fetch and update user data when the widget is first built
  _fetchAndUpdateUserData();
}

void _fetchAndUpdateUserData() async {
  var snapshot = await getUserDocument();
  var userData = snapshot.data() as Map<String, dynamic>;
  setState(() {
    // Update local state variables
    profilePicUrl = userData['profilepic'];
  });
}

  @override
  Widget build(BuildContext context) {
    void logOut() {
      final _auth = AuthMethods();
      _auth.signOut();
    }

    return Drawer(
      child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        // Assuming you have a function to get the user document
        future: getUserDocument(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while fetching data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle error if any
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data == null) {
            // If no user data is available, you can handle it accordingly
            return Text("No user data available");
          }

          var userData = snapshot.data!.data();
          // String profilePicUrl = userData?['profile_pic'] ?? "";
            String? profilePicUrl = userData != null ? userData['profilepic'] : null;

          return ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 252, 209, 209),
                ),
                arrowColor: const Color.fromARGB(255, 230, 227, 221),
                accountName: Text(
                  userData?['name'] ?? 'Guest User',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  userData?['email'] ?? 'guest@example.com',
                  style: TextStyle(color: Colors.black),
                ),


currentAccountPicture: CircleAvatar(
  backgroundImage: profilePicUrl != null && profilePicUrl.isNotEmpty
      ? NetworkImage(profilePicUrl)
      : AssetImage("assets/default_profile_pic.jpg") as ImageProvider<Object>,
  radius: 60,
),  
              ),

              Card(
                // color: Color.fromARGB(255, 235, 168, 168),
                                  color: Color.fromARGB(255, 252, 209, 209),
                child: ListTile(
                  hoverColor: Colors.lightGreen,
                  title: Text('My Account'),
                  leading: Icon(Icons.login),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (v) {
                        return MyProfile();
                      }),
                    );
                  },
                ),
              ),
              // ... Add other cards as needed
              Card(
                                  color: Color.fromARGB(255, 252, 209, 209),
                child: ListTile(
                  hoverColor: Colors.lightGreen,
                  title: Text('logout'),
                  leading: Icon(Icons.logout),
                  onTap: () {
                    logOut();
                    {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => LoginPage())));
                    }
                  },
                ),
              ),
              Card(
                                  color: Color.fromARGB(255, 252, 209, 209),
                  child: ListTile(
                    hoverColor: Colors.lightGreen,
                    title: Text('ABOUT'),
                    leading: Icon(Icons.info_outline),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    },
                  )),

             ]     );
            }
      )
      );
        }
  }

 Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocument() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      return await FirebaseFirestore.instance.collection("users").doc(uid).get();
    } else {
      return Future.value(null);
    }
  }











