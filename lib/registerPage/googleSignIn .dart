import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<UserCredential?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      return await _auth.signInWithCredential(credential);
    }
  } catch (e) {
    // Handle login failure
    print(e.toString());
  }
  return null;
}

// // import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
//   'email',
//   'https://www.googleapis.com/auth/contacts.readonly'
// ]);

// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   State<SignInPage> createState() => _SignINPageState();
// }

// class _SignINPageState extends State<SignInPage> {
//    late GoogleSignInAccount currentUser;

//   @override
//   void initState() {
//     super.initState();

//     _googleSignIn.onCurrentUserChanged.listen((account) {
//       setState(() {
//         currentUser = account!;
//       });
//       if (currentUser != null) {
//         print("user is already authenticated");
//       }
//     });
//     _googleSignIn.signInSilently();
//   }

//   Future<GoogleSignInAccount?> handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (error) {
//       print("Sign In error :" + error.toString());
//     }
//     return null;
//   }

//   Future<GoogleSignInAccount?> handleSignOut() => _googleSignIn.disconnect();

//   Widget buildBody() {
//     GoogleSignInAccount user = currentUser;
//     if (user != null) {
//       return Column(
//         children: [
//           SizedBox(
//             height: 90,
//           ),
//           GoogleUserCircleAvatar(identity: user),
//           SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: Text(
//               user.displayName ?? '',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Center(
//             child: Text(
//               user.email,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//                 // fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 60,
//           ),
//           Center(
//             child: Text(
//               "Welcome  to Geeks for  Geeks",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           ElevatedButton(onPressed: handleSignOut, child: Text("Sign out")),
//         ],
//       );
//     } else {
//       return Column(children: [
//         SizedBox(
//           height: 90,
//         ),
         
//          Center(
//           child: Image(image: AssetImage("assets/Group 123.png"), height: 200, width: 200,),
//          ),
//          SizedBox(height: 40,),

//          Padding(padding: EdgeInsets.all(8), child: Text("Wlcome to Google Authentication", textAlign: TextAlign.center,
//          style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//          ),),),
//          SizedBox(height: 30),

//          Center(
//           child: Container(
//             width: 250,
//             child: ElevatedButton(onPressed: handleSignIn, child: Padding(padding: EdgeInsets.all(15.0),
//              child:Row(
//               children: [
//                 Image.asset("assets/Group 123.png", height: 20, width: 20,),
//                 SizedBox(width: 20,),
//                 Text("Google Sign In"),
//               ],
//              ) ,)),
//           ),
//          )
//       ]);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: buildBody(),
//       ),
//     );
//   }
// }
