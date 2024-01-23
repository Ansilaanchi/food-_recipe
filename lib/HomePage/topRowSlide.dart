import 'package:flutter/material.dart';
import 'package:foodie_zone/rowpages/breakfast.dart';
import 'package:foodie_zone/rowpages/brunch.dart';
import 'package:foodie_zone/rowpages/dinner.dart';
import 'package:foodie_zone/rowpages/high-tea.dart';
import 'package:foodie_zone/rowpages/lunch.dart';

class TopRowSlide extends StatefulWidget {
  const TopRowSlide({super.key});

  @override
  State<TopRowSlide> createState() => _TopRowSlideState();
}

class _TopRowSlideState extends State<TopRowSlide> {
  @override
  Widget build(BuildContext context) {
    return  Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  Breakfast()));
                            },
                            child: categoryStack(
                                "assets/download-removebg-preview.png",
                                "Breakfast")),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  Brunch()));
                            },
                            child: categoryStack(
                                "assets/download__2_-removebg-preview.png",
                                "Brunch")),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  Lunch()));
                            },
                            child: categoryStack(
                                "assets/images__6_-removebg-preview.png",
                                "Lunch")),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  HighTea()));
                            },
                            child: categoryStack(
                                "assets/download__1_-removebg-preview.png",
                                "High-tea")),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  Dinner()));
                            },
                            child: categoryStack(
                                "assets/fd1-removebg-preview.png", "Dinner")),
                      ],
                    );
  }

  Column categoryStack(String picture, String text) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(picture)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 20,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
      )
    ],
  );
}

}