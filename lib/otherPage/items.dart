import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  // decoration: BoxDecoation(
                  //   borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20))
                  // ),
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  color: const Color.fromARGB(255, 196, 207, 212),
                 
                ),
                Positioned(
                  // top: 40,
                  child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 250,
                  // height:MediaQuery.sizeOf(context).height ,
                  color: Colors.amberAccent,
                   child: Image(
                    image: AssetImage(
                      'assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                )),

Positioned(
  top: 240,
  child: Container(
  height: MediaQuery.sizeOf(context).height,
  width: MediaQuery.sizeOf(context).width,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
),
child: Column(
  children: [

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
      Text("Gulgul_Burane", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),),
      IconButton(onPressed: (){}, icon: Icon(Icons.star, color:Colors.yellow,size: 35,))
      ],
    ),

Column(
          children: [
            SizedBox(height: 20,),
            Center(child: Text("INGREDIENTS (Us Cup = 240ml)", style: TextStyle( color: Colors.black, fontSize: 20,           fontWeight: FontWeight.bold,
        ),)),
        
        SizedBox(height: 20,),
         Container(
          height: 250, width: 400,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 240, 230, 196),
          ),
          child: Column(
            children: [
              Text(" * 2 Cups Atta ", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
              Text(" * 3/4 cup warm water (or hot water, 2 to 4 tbsps more as required read notes) ", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
              Text("* 1/4 teaspoon salt (optional)", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
              Text("* 1 to 1 1/2 tablespoons oil (optional, read notes )", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
              Text("* 2 to 2 1/2 tablespoons ghee or oil ", style: TextStyle(color: Color.fromARGB(255, 17, 3, 58), fontSize: 18),),
        
            ],
          ),
         ),
        
        Container(
          // height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
             decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 218, 235, 243),
          ),
          child: Column(
            children: [
        Text("INSTRUCTIONS", style: TextStyle( fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold ),),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text("Add two cups of wheat flour to a bowl, add a pinch of salt and mix everything. Add two tablespoons of yoghurt and mix everything."),
        )  , 
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text("Adding yoghurt makes the chapatis softer and they stay soft for long period of time"),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text("Finally add a teaspoon of oil, knead again and make a soft, non-sticky dough.Cling wrap it and rest the dough for about 30 minutes.\n Now make small balls and dust them with some flour.Add some flour to your rolling surface.Roll them into thin circles using a rolling pin."),
        ),
        Text("Take a skillet and heat it. Place the rolled chapathi on the skillet and when you see small bubbles appearing apply a little oil on it.Cook them for a few secondsFlip and cook on other side, too. Also apply a few drops of oil on other side."),
        
        Text("Enjoy the Chapatis With Any Curry..."),
         ],
          ),
        ),
        
          ],
        ),
 

  ],
),

)),

              ],
            )
          ],
        ),
      ),
    );
  }
}
