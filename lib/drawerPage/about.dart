import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 198, 209),
      appBar: AppBar(
        title: Text("ABOUT", style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold,
        ),),
        
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

          Text("Hey...", style: TextStyle(
          fontSize: 25,fontWeight: FontWeight.w400,
        ),),

            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("This Recipe App definetly helps you to become a qualified chef. in this platform, We include Breakfast, Brunch, Lunch, HighTea and Dinner. You can add your suggestions for our better features. ", ),
            ),

            // SizedBox(height: 10,),

          ],
        ),
      ),
    );
//       Stack(
//         children: [
//           Positioned(
            
//             child: CustomPaint(
//               painter:AppBarPainter() ,

//             )),
//         ],
//       ),
//     );
//   }
// }


// class AppBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.fill;

//       var path = Path();
//       path.moveTo(0.0, 0.0);
//       path.lineTo(20.0, 0.0);

//       path.quadraticBezierTo(40.0, 0.0, 50.0, 30.0);
//       path.quadraticBezierTo(60.0, 55.0, 90.0, 55.0);
//       path.quadraticBezierTo(120.0, 50.0, 150.0, 30.0);
//       path.quadraticBezierTo(140.0, 0.0, 160.0, 0.0);


//       path.lineTo(size.width-20.0, 0.0);

//       path.quadraticBezierTo(size.width, 0.0, size.width, 25.0);
//       path.lineTo(size.width, size.height-25.0);
//       path.quadraticBezierTo(size.width, size.height, size.width-25.0, size.height);
//       path.lineTo(25.0, size.height);
//       path.quadraticBezierTo(0.0, size.height, 0.0, size.height-25.0);
//       path.lineTo(0.0, 25.0);
//       path.quadraticBezierTo(0.0, 0.0, 25.0, 0.0);
//       path.close();


//     // Draw the app bar

//     canvas.drawPath(path, paint);
//     canvas.drawCircle(Offset(90.0, 10.0),35.0,paint);

//     canvas.drawRect(
//       Rect.fromPoints(
//         Offset(0, 0),
//         Offset(size.width, size.height),
//       ),
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
  
  }
}
