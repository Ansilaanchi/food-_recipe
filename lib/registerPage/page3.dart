// import 'package:flutter/material.dart';
// import 'package:foodie_zone/category.dart';
// // import 'package:foodie_zone/lognauth.dart';
// // import 'package:foodie_zone/homePage.dart';

// class SignUp extends StatefulWidget {

//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {

//   final _formkey = GlobalKey<FormState>();
//   bool isLoading = false;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

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
//                 Container(
//                   width: MediaQuery.sizeOf(context).width,
//                    child: Image(
//                       image: AssetImage(
//                           "assets/60f1814877915820262bfb1664da2898-removebg-preview.png")),

//                 ),

//                 SizedBox(
//                   height: 80,
//                   width: 350,
//                   child: TextFormField(
//                     controller: nameController,
//                     validator: (text){
//                       if (text == null || text.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       suffixIcon: Icon(Icons.person),
//                       hintText: "Name",
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
//                       controller: emailController,
//                     validator: (text){
//                       if (text == null || text.isEmpty) {
//                         return 'Please enter your Email';
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
//                       controller: passwordController,
//                     validator: (text){
//                       if (text == null || text.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       // border: InputBorder.none,
//                       border: OutlineInputBorder(),
//                       suffixIcon: Icon(Icons.remove_red_eye),
//                       hintText: "Enter your Password",
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
//                 // DropdownButtonApp(),
//                 Container(
//                   width: 350,
//                   height: 50,
//                   padding: EdgeInsets.only(left: 25),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 255, 253, 253),
//                     borderRadius: BorderRadius.circular(30),
//                   ),

//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: DropdownButtonApp(),
//                     )),

//                 const SizedBox(
//                   height: 25,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                         if (_formkey.currentState!.validate()) {
//                           // signInWithEmailAndPassword();
//                           print("validation is Done");
//                         }
//                   },
//                   child: Container(
//                     height: 60,
//                     width: 350,
//                     // width: MediaQuery.sizeOf(context).width,

//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 4, 119, 212),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                    child: Center(
//                       child: isLoading
//                           ? Center(
//                               child: CircularProgressIndicator(
//                               color: Colors.white,
//                             ))
//                           : Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                     ),
//                   ),
//                 ),
//                     ],
//                   ),
//           ),

//             ],
//           ),

//       );
//   }
//   }

import 'package:flutter/material.dart';
import 'package:foodie_zone/HomePage/homePage.dart';
import 'package:foodie_zone/services/AuthMethod.dart';

class SignUp extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";
  String _userName = "";
 String _bio = "";
 String _profilepic ="";

  bool _isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
    final TextEditingController profilepicController = TextEditingController();



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
                    key: _formKey,
                    child: Column(

                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        
              Container(
                 width: MediaQuery.sizeOf(context).width,
                  child: Image(
                     image: AssetImage(
                         "assets/60f1814877915820262bfb1664da2898-removebg-preview.png")),
                   
               ),
                        SizedBox(
                           height: 80,
                  width: 350,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Name',
                            border: OutlineInputBorder()),
                            validator: (input) => input!.trim().isEmpty
                                ? 'Please enter a valid name'
                                : null,
                            onSaved: (input) => _name = input!,
                          ),
                        ),
                //           SizedBox(
                //   height: 18,
                // ),
                        SizedBox(
                             height: 80,
                  width: 350,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Username',
                                                        border: OutlineInputBorder()
),
                            validator: (input) => input!.trim().isEmpty
                                ? 'Please enter a valid username'
                                : null,
                            onSaved: (input) => _userName = input!,
                          ),
                        ),

                        SizedBox(
                             height: 80,
                  width: 350,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'bio',
                                                        border: OutlineInputBorder()
),
                            validator: (input) => input!.trim().isEmpty
                                ? 'Please enter a valid bio'
                                : null,
                            onSaved: (input) => _bio = input!,
                          ),
                        ),
                //           SizedBox(
                //   height: 18,
                // ),
                        SizedBox(
                             height: 80,
                  width: 350,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(labelText: 'Email',
                                                        border: OutlineInputBorder()
),
                            validator: (input) => !input!.contains('@')
                                ? 'Please enter a valid email'
                                : null,
                            onSaved: (input) => _email = input!,
                          ),
                        ),
                //           SizedBox(
                //   height: 18,
                // ),
                        SizedBox(
                             height: 80,
                  width: 350,
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(labelText: 'Password',
                            border: OutlineInputBorder()
                            ),
                            validator: (input) => input!.length < 6
                                ? 'Must be at least 6 characters'
                                : null,
                            onSaved: (input) => _password = input!,
                            obscureText: true,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
                          child: Container(
                            width: double.infinity,
                            color: Colors.blue,
                            child: _isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : TextButton(
                                    onPressed: () => _signUp(),
                                   
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Back to Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
      ),
        );
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      // Logging in the user w/ Firebase
      String result = await AuthMethods().signUpUser(
          name: _name, 
          email: _email,
          bio:_bio ,
          password: _password,
           username: _userName);
      if (result != 'success') {
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }
      setState(() {
        _isLoading = false;
      });
    }
  }
}
