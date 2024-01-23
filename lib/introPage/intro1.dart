import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodie_zone/introPage/introPart.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  _IntroOneState createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
  @override
  void initState() {
    super.initState();
    checkIntroStatus();
  }

  Future<void> checkIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('showIntro') ?? true;

    if (!showIntro) {
      // If intro has been seen, navigate to the next page
      navigateToNextPage();
    }
  }

  Future<void> navigateToNextPage() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AnimatedBuilderExampleApp()),
    );
  }

  Future<void> markIntroAsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('showIntro', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 172, 180, 187),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            markIntroAsSeen();
            navigateToNextPage();
          },
          child: Icon(Icons.arrow_forward_ios_rounded),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: 400,
                child: const Image(
                  image: AssetImage("assets/856bca25c1c2cbaf608d598f844c1a05.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 340,
                left: 25,
                child: Text(
                  "Are you ready...!",
                  style: GoogleFonts.adamina(
                    fontSize: 50,
                    color: Color.fromARGB(255, 248, 248, 248),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:foodie_zone/introPage/introPart.dart';
// // import 'package:foodie_zone/page2.dart';
// import 'package:google_fonts/google_fonts.dart';

// class IntroOne extends StatefulWidget {
//   const IntroOne({super.key});

//   @override
//   State<IntroOne> createState() => __IntroOneState();
// }

// class __IntroOneState extends State<IntroOne> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// floatingActionButton: Container(
//   height: 60, width: 60,
//   decoration: BoxDecoration(
//     color: const Color.fromARGB(255, 172, 180, 187),
//     borderRadius: BorderRadius.circular(10),
//   ),
//   child: IconButton(onPressed: (){
//     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AnimatedBuilderExampleApp ()));
//   }, icon: Icon(Icons.arrow_forward_ios_rounded), iconSize: 25,color: Colors.white,),
// ),

//         body: ListView(
//       children: [
//         Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height,
//               width: 400,
//               // width: MediaQuery.of(context).size.width,
//               child: const Image(
//                 image: AssetImage("assets/856bca25c1c2cbaf608d598f844c1a05.jpg",  ),
//                 fit: BoxFit.cover,
//               ),
          
//             ),
            
//             Positioned(
//                 top: 340,
//                 left: 25,
//                 child: Text("Are you ready...!",
//                     style: GoogleFonts.adamina(
//                         fontSize: 50,
//                         color: Color.fromARGB(255, 248, 248, 248),
//                         fontStyle: FontStyle.italic))),
           
//           ],
//         ),
//       ],
//     ));
//   }
// }

