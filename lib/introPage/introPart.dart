import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:foodie_zone/HomePage/homePage.dart';
import 'package:foodie_zone/registerPage/page2.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(AnimatedBuilderExampleApp());
}

class AnimatedBuilderExampleApp extends StatelessWidget {
  const AnimatedBuilderExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: shouldShowIntro(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return HomePage();
            } else {
              return AnimatedBuilderExampleScreen();
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<bool> shouldShowIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('showIntro') ?? true;

    return showIntro;
  }
}

class AnimatedBuilderExampleScreen extends StatelessWidget {
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
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          icon: Icon(Icons.arrow_forward_ios_rounded),
          iconSize: 25,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image(
                  image: AssetImage("assets/HD-wallpaper-cute-chef-pretty-food-flour-cute-chef-dough-girl-rolling-pastry-bowl.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 450.0,
                height: 450.0,
                color: Colors.transparent,
                child: const Center(
                  child: Text(
                    'More easy & \n  Better finishing',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              AnimatedBuilderExample(),
            ],
          ),
        ],
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Your introductory page UI implementation goes here
      // ...
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 450.0,
        height: 450.0,
        color: Colors.transparent,
        child: const Center(
        //   child: Text(
        //     // 'mOre eAsY & \n  BetteR finiShiNg',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 35,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}





// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:foodie_zone/registerPage/page2.dart';

// /// Flutter code sample for [AnimatedBuilder].

// // void main() => runApp(const AnimatedBuilderExampleApp());

// class AnimatedBuilderExampleApp extends StatefulWidget {
//   const AnimatedBuilderExampleApp({super.key});

//   @override
//   State<AnimatedBuilderExampleApp> createState() => _AnimatedBuilderExampleAppState();
// }

// class _AnimatedBuilderExampleAppState extends State<AnimatedBuilderExampleApp> {
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:Scaffold(
//       floatingActionButton: Container(
//   height: 60, width: 60,
//   decoration: BoxDecoration(
//     color: const Color.fromARGB(255, 172, 180, 187),
//     borderRadius: BorderRadius.circular(10),
//   ),
//   child: IconButton(onPressed: (){
//     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
//   }, icon: Icon(Icons.arrow_forward_ios_rounded), iconSize: 25,color: Colors.white,),
// ),


// body: ListView(children: [
// Stack(

//   children: [
//     Container(
//       height: MediaQuery.sizeOf(context).height,
//       child: Image(image: AssetImage("assets/HD-wallpaper-cute-chef-pretty-food-flour-cute-chef-dough-girl-rolling-pastry-bowl.jpg"),
//       fit: BoxFit.cover,),
    
//       ),

//       Container(
//         width: 450.0,
//         height: 450.0,
//         color: Colors.transparent,
//         child: const Center(
//           child: Text('More easy & \n  Better finishing', style: TextStyle(
//             color: Colors.white,
//             fontSize: 35,
//             fontWeight: FontWeight.bold
//           ),),
//         ),
//       ),


//     //  AnimatedBuilderExample(),

//   ],
// ),

// ],)
// //  AnimatedBuilderExample(),

//       )

//     );
    
//   }
// }

// class AnimatedBuilderExample extends StatefulWidget {
//   const AnimatedBuilderExample({super.key});

//   @override
//   State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
// }

// /// AnimationControllers can be created with `vsync: this` because of
// /// TickerProviderStateMixin.
// class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
//     with TickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 5),
//     vsync: this,
//   );
//   // ..repeat();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       child: Container(
//         width: 450.0,
//         height: 450.0,
//         color: Colors.transparent,
//         child: const Center(
//           child: Text('mOre eAsY & \n  BetteR finiShiNg', style: TextStyle(
//             color: Colors.white,
//             fontSize: 35,
//             fontWeight: FontWeight.bold
//           ),),
//         ),
//       ),
//       builder: (BuildContext context, Widget? child) {
//         return Transform.rotate(
//           angle: _controller.value * 2.0 * math.pi,
//           child: child,
//         );
//       },
//     );
//   }
// }
