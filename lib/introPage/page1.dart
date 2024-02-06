import 'package:flutter/material.dart';
import 'package:foodie_zone/introPage/intro1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isFinished = false;

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
    await Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: const IntroOne(),
      ),
    );

    // Set showIntro to false to indicate that intro has been seen
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('showIntro', false);

    // For reverse ripple effect animation
    setState(() {
      isFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image(
              image: AssetImage("assets/5fca8b4184b53e36a2c63e4e2b20b99f.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 35,
            child: Text(
              "FoODie",
              style: GoogleFonts.rubikBubbles(
                fontSize: 60,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 60,
            child: Text(
              "zoNe",
              style: GoogleFonts.rubikBubbles(
                fontSize: 55,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: Container(
              height: 50,
              width: 300,
              child: SwipeableButtonView(
                buttonText: 'SLIDE HERE..!',
                buttontextstyle: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                buttonWidget: const SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
                activeColor: Color.fromARGB(255, 2, 36, 16),
                isFinished: isFinished,
                onWaitingProcess: () {
                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      isFinished = true;
                    });
                  });
                },
                onFinish: navigateToNextPage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:foodie_zone/introPage/intro1.dart';
// // import 'package:foodie_zone/page2.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:swipeable_button_view/swipeable_button_view.dart';

// class IntroPage extends StatefulWidget {
//   const IntroPage({super.key});

//   @override
//   State<IntroPage> createState() => _IntroPageState();
// }

// class _IntroPageState extends State<IntroPage> {
//   bool isFinished = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//               // height: 250,
//               height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Image(
//                 image:
//                     AssetImage("assets/5fca8b4184b53e36a2c63e4e2b20b99f.jpg"),
//                 fit: BoxFit.cover,
//               )),
//           Positioned(
//               top: 40,
//               // bottom: 130,
//               left: 35,
//               child: Text("FoODie",
//                   style: GoogleFonts.rubikBubbles(
//                       fontSize: 60,
//                       color: Colors.black,
//                       fontStyle: FontStyle.italic))),
//           Positioned(
//               top: 100,
//               // bottom: 80,
//               right: 60,
//               child: Text("zoNe",
//                   style: GoogleFonts.rubikBubbles(
//                       fontSize: 55, color: Colors.black))),
//           Positioned(
//               bottom: 30,
//               left: 30,
//               child: Container(
//                 height: 50,
//                 width: 300,
//                 child: SwipeableButtonView(
//                     buttonText: 'SLIDE HERE..!',
//                     buttontextstyle: const TextStyle(
//                         fontSize: 25,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                     buttonWidget: const SizedBox(
//                       height: 60,
//                       width: double.infinity,
//                       child: Icon(
//                         Icons.arrow_forward_ios_rounded,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     activeColor: Color.fromARGB(255, 2, 36, 16),
//                     isFinished: isFinished,
//                     onWaitingProcess: () {
//                       Future.delayed(Duration(seconds: 2), () {
//                         setState(() {
//                           isFinished = true;
//                         });
//                       });
//                     },
//                     onFinish: () async {
//                       await Navigator.push(
//                           context,
//                           PageTransition(
//                             type: PageTransitionType.fade,
//                             // child: LoginPage()
//                             child: const IntroOne(),
//                           ));

//                       //TODO: For reverse ripple effect animation
//                       setState(() {
//                         isFinished = false;
//                       });
//                     }),
//                 //
//               ))
//         ],
//       ),
//     );
//   }
// }

// // body: SingleChildScrollView(
// //   scrollDirection: Axis.vertical,
// //   child: ListView(
// //         children: [
// //   Stack(
// //     children: [
// //       Container(
// //         height: double.infinity,
// //         width: double.infinity,
// //         child: Image(
// //           image: AssetImage("assets/5fca8b4184b53e36a2c63e4e2b20b99f.jpg"),
// //           fit: BoxFit.cover,
// //         ),
// //       ),
// //       Positioned(
// //           top: 150,
// //           left: 40,
// //           child: Text("FoODie",
// //               style: GoogleFonts.rubikBubbles(
// //                   fontSize: 60,
// //                   color: Colors.white,
// //                   fontStyle: FontStyle.italic))),
// //       Positioned(
// //           top: 220,
// //           right: 60,
// //           child: Text("zoNe",
// //               style: GoogleFonts.rubikBubbles(
// //                   fontSize: 50, color: Colors.white))),

// //       Positioned(
// //         bottom: 10,
// //         child: Column(
// //           children: [

// //             SwipeableButtonView(
// //               buttonText: 'SLIDE HERE..!',
// //               buttontextstyle: const TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
// //               buttonWidget: const SizedBox(
// //                 height: 60, width: double.infinity,
// //                 child: Icon(
// //                   Icons.arrow_forward_ios_rounded,
// //                   color: Colors.grey,
// //                 ),
// //               ),
// //               activeColor: Color.fromARGB(255, 2, 36, 16),
// //               isFinished: isFinished,
// //               onWaitingProcess: () {
// //                 Future.delayed(Duration(seconds: 2), () {
// //                   setState(() {
// //                     isFinished = true;
// //                   });
// //                 });
// //               },
// //               onFinish: () async {
// //                 await Navigator.push(
// //                     context,
// //                     PageTransition(
// //                         type: PageTransitionType.fade,
// //                         // child: LoginPage()
// //                         child: const IntroOne(),
// //                         ));

// //                 //TODO: For reverse ripple effect animation
// //                 setState(() {
// //                   isFinished = false;
// //                 });
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     ],
// //   ),
// //         ],
// //       ),
// // )
