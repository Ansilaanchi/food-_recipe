import 'package:flutter/material.dart';
import 'package:foodie_zone/HomePage/tdyCkngPg.dart';

Widget CookingDay(BuildContext context){
  return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TodayCooking()));
                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 77, 65, 65),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "What are you \n cooking \n today..?",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 200,
                    right: 13,
                    child: Container(
                      height: 300, width: 200,
                      // child: Image(image: AssetImage("assets/bach2fd.jpg"))
                      child: Image(
                          image: AssetImage(
                              "assets/cutegirl-removebg-preview (1).png")),
                    )),
              ],
            );

}