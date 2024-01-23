import 'package:flutter/material.dart';
import 'package:foodie_zone/rowpages/breakfast.dart';
import 'package:foodie_zone/rowpages/brunch.dart';
import 'package:foodie_zone/rowpages/dinner.dart';
import 'package:foodie_zone/rowpages/high-tea.dart';
import 'package:foodie_zone/rowpages/lunch.dart';

class TodayCooking extends StatefulWidget {
  const TodayCooking({super.key});

  @override
  State<TodayCooking> createState() => _TodayCookingState();
}

class _TodayCookingState extends State<TodayCooking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
      
              GestureDetector(
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Breakfast()));
                },
                child: Row(
                  children: [
                   SizedBox(
                    height: 100, width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIRmyixqI-cS9DBns6Wp-5-s7HodFKisegDu_TQUxpU9g5sDDxfDqx0Y2yBmRn7oMVDG8&usqp=CAU', fit: BoxFit.cover,),
                    ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text("BREAKFAST", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                   )
                  ],
                ),
              ),
              SizedBox(height: 20,),
      
               GestureDetector(
                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Brunch()));
      
                },
                 child: Row(
                  children: [
                   SizedBox(
                    height: 100, width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.network('https://static.vecteezy.com/system/resources/thumbnails/004/630/108/small_2x/healthy-breakfast-with-vegetable-and-fried-egg-and-meat-free-vector.jpg', fit: BoxFit.cover,),
                    ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text("BRUNCH", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                   )
                  ],
                             ),
               ),
              SizedBox(height: 20,),
      
               GestureDetector(
                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>(Lunch())));
      
                },
                 child: Row(
                  children: [
                   SizedBox(
                    height: 100, width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.network('https://static.vecteezy.com/system/resources/thumbnails/007/190/794/small_2x/top-view-of-lunch-meat-on-wooden-tray-free-vector.jpg', fit: BoxFit.cover,),
                    ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text("LUNCH", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                   )
                  ],
                             ),
               ),
              SizedBox(height: 20,),
      
               GestureDetector(
                onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>HighTea()));
                },
                 child: Row(
                  children: [
                   SizedBox(
                    height: 100, width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1jY-huYGAVDHGof0CZgk0h4ExSikMRZEhu8iLwVDf884DLDcrkjxTkaTXfmN2euVBUxM&usqp=CAU', fit: BoxFit.cover,),
                    ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text("HIGH_TEA", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                   )
                  ],
                             ),
               ),
              SizedBox(height: 20,),
      
               GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dinner()));
                },
                 child: Row(
                  children: [
                   SizedBox(
                    height: 100, width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdhf0pPh59hxbEy0F7DPzq1aRs4xe2_7YHhqpos85nGfifozNaHJ1UPPUP8fKCfNAc6I4&usqp=CAU', fit: BoxFit.cover,),
                    ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text("DINNER", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                   )
                  ],
                             ),
               ),
      
            ],
          ),
        ),
      
      ),
    );
  }
}