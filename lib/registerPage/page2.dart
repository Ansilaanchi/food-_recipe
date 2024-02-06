import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/registerPage/forgot.dart';
import 'package:foodie_zone/HomePage/homePage.dart';
import 'package:foodie_zone/registerPage/page3.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscurePassword = true;

  signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user found for that Email')));
      } else if (e.code == 'wrong-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong password provided for that user")));
      }
    }
  }

  Future<void> saveLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Image(
                          image: AssetImage(
                              "assets/Female-Chef-Logo-template-on-transparent-background-PNG-removebg-preview.png")),
                    ),
                    Positioned(
                        top: 300,
                        left: 100,
                        child: Text(
                          "FooDie ZoNe",
                          style: GoogleFonts.aclonica(
                              fontSize: 25,
                              color: Colors.white,
                              fontStyle: FontStyle.italic),
                        )),
                  ],
                ),
                SizedBox(
                  height: 80,
                  width: 350,
                  child: TextFormField(
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email),
                      hintText: "Enter your Email",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                SizedBox(
                  height: 80,
                  width: 350,
                  child: TextFormField(
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: isObscurePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscurePassword = !isObscurePassword;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 200),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => ResetPasswordScreen()));
                      },
                      child: Text(
                        "forgot password?",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),

                SizedBox(
                  height: 60,
                  width: 350,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 72, 167, 245))),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        try {
                          await _auth.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          saveLoginStatus(); // Save login status to shared preferences
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        } catch (e) {
                          // Provide feedback to the user about login failure
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login failed: $e'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          print('Login Error: $e');
                        }
                      }
                    },
                    child: Center(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // SizedBox(
                //   child: Padding(
                //     padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                //     child: Row(
                //       children: [
                //         Expanded(child: Divider()),
                //         Text(" Or Login With "),
                //         Expanded(child: Divider()),
                //       ],
                //     ),
                //   ),
                // ),

                // Padding(
                //   padding: EdgeInsets.only(top: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       GestureDetector(
                //           onTap: () {
                //             // Handle Google Sign-In
                //           },
                //           child: netCo("assets/Group 123.png")),
                //       netCo("assets/Vector.png"),
                //       // netCo("assets/cib_apple.png"),
                //     ],
                //   ),
                // ),

                Padding(
                  padding: EdgeInsets.only(top: 50, left: 60),
                  child: Row(
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container netCo(String image) {
    return Container(
      height: 70,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(31, 5, 5, 5)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Image(image: AssetImage(image)),
    );
  }
}








// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie_zone/registerPage/forgot.dart';
// // import 'package:foodie_zone/googleSignIn%20.dart';
// import 'package:foodie_zone/HomePage/homePage.dart';
// // import 'package:foodie_zone/homePage.dart';
// import 'package:foodie_zone/registerPage/page3.dart';
// // import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class LoginPage extends StatefulWidget {
//   LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   final _formkey = GlobalKey<FormState>();
//   bool isLoading = false;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   bool isObscurePassword = true;
  


//   signInWithEmailAndPassword() async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       setState(() {
//         isLoading = false;
//       });
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       if (e.code == 'user-not-found') {
//         return ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('No user found for that Email')));
//       } else if (e.code == 'wrong-password') {
//         return ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Wrong password provided for that user")));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           Form(
//             key: _formkey,
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Image(
//                           image: AssetImage(
//                               "assets/Female-Chef-Logo-template-on-transparent-background-PNG-removebg-preview.png")),
//                     ),
//                     Positioned(
//                         top: 300,
//                         left: 100,
//                         child: Text(
//                           "FooDie ZoNe",
//                           style: GoogleFonts.aclonica(
//                               fontSize: 25,
//                               color: Colors.white,
//                               fontStyle: FontStyle.italic),
//                         )),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 80,
//                   width: 350,
//                   child: TextFormField(
//                     controller: emailController,
//                     validator: (text) {
//                       if (text == null || text.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       suffixIcon: Icon(Icons.email),
//                       hintText: "Enter your Email",
//                       hintStyle: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),

//                 SizedBox(
//                   height: 80,
//                   width: 350,
//                   child: TextFormField(
//                     controller: passwordController,
//                     validator: (text) {
//                       // bool isPasswordTextField;
//                       if (text == null || text.isEmpty ) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
// // obscureText: isPasswordTextField ? isObscurePassword : false,    
//            decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                 //        suffixIcon: isPasswordTextField
//                 // ? IconButton(
//                 //     onPressed: () {
//                 //       setState(() {
//                 //         isObscurePassword = !isObscurePassword;
//                 //       });
//                 //     }, 
//                 //     icon: Icon(Icons.remove_red_eye))
//                 // : null,
//                       suffixIcon: Icon(Icons.remove_red_eye),
//                       hintText: "Enter your Password",
//                       hintStyle: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),


//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 200),
//                   child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (contex) => ResetPasswordScreen()));
//                       },
//                       child: Text(
//                         "forgot password?",
//                         style: TextStyle(color: Colors.blue, fontSize: 15),
//                       )),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),

// //          
//               SizedBox(
//                 height: 60,
//                 width: 350,
                
//                 child: ElevatedButton(
                  
//                   style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 72, 167, 245))),
//                   onPressed: () async {
                  
//                     if (_formkey.currentState!.validate()) {
                      
//                       try {
//                         await _auth.signInWithEmailAndPassword(
                          
//                            email: emailController.text.trim(), password: passwordController.text.trim(),
//                         );
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const HomePage()),
//                         );
//                       } catch (e) {
//                         // Provide feedback to the user about login failure
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Login failed: $e'),
//                             duration: Duration(seconds: 3),
//                           ),
//                         );
//                         print('Login Error: $e');

//                          // Save login status to shared preferences
//                 saveLoginStatus();

//                 // Navigate to the next screen
//                 Navigator.pushReplacementNamed(context, '/home');
            
//                       }
                      
//                     }
//                   },
                  
//                   child: Center(
//                     child: const Text('Login', style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25, fontWeight: FontWeight.bold,
//                     ),),
//                   ),
//                 ),
//               ),


//                 SizedBox(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 10, right: 10, top: 20),
//                     child: Row(
//                       children: [
//                         Expanded(child: Divider()),
//                         Text(" Or Login With "),
//                         Expanded(child: Divider()),
//                       ],
//                     ),
//                   ),
//                 ),
    
//                 Padding(
//                   padding: EdgeInsets.only(top: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                        GestureDetector(
//                         onTap: (){
//                           // return SignInPage();
//                           // navigator?.push(MaterialPageRoute(builder: (context)=> FirebaseAuth()));
//                         },
//                         child: netCo("assets/Group 123.png")),
//                       netCo("assets/Vector.png"),
//                       // netCo("assets/cib_apple.png"),
//                     ],
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.only(top: 50, left: 60),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Don't have an account ?",
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => SignUp()));
//                         },
//                         child: Text(
//                           "Register Now",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container netCo(String image) {
//     return Container(
//       height: 70,
//       width: 110,
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromARGB(31, 5, 5, 5)),
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.transparent,
//       ),
//       child: Image(image: AssetImage(image)),
//     );
//   }
//   Future<void> saveLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', true);
//   }
// }

