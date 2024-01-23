import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget carousel_slider(BuildContext context){
  return  CarouselSlider(
      items: [
        GestureDetector(
          onTap: (){

          },
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/l-intro-1684783348.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(
                    "assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(25)),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("assets/l-intro-1684783348.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(25)),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(
                    "assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(25)),
        ),
      ],
      options: CarouselOptions(
        height: 180,
        aspectRatio: 16 / 8,
        viewportFraction: 0.6,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        // reverse: true,
      ));
}

