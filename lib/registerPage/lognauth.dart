import 'package:firebase_auth/firebase_auth.dart';

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Handle successful login
  } catch (e) {
    // Handle login failure
    print(e.toString());
  }
}
