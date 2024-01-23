import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_zone/drawerPage/dummy.dart';
// import 'package:order/data.dart';

class recipe extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          "Recipes",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),

      ),
      body:
      ListView(
        children: [
          // Text(this.name),

          //SizedBox(height:10,),
          Card(
            child: ListTile(
             leading: Text('Hamburger    '),
              trailing: Icon(Icons.favorite),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Column(

              children: [
                Card(
                  child: RichText(
                    text: TextSpan(
                      text: 'Ingredients',
                      style: TextStyle(color: Colors.red, fontSize: 18.0),

    ),
                  ),
                ),
                ListTile(
                  leading: Text('1)'),
                  title: Text('500 gram of meat'),

                ),

                ListTile(
                  leading: Text('2)'),
                  title: Text('salt & pepper'),

                ),
                ListTile(
                  leading: Text('3)'),
                  title: Text('ketchup'),

                ),
                ListTile(
                  leading: Text('1)'),
                  title: Text('meat'),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                      height: 5,
                      color: Colors.redAccent
                  ),
                ),
                Text(re1, overflow: TextOverflow.clip,)
    ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
                height: 5,
                color: Colors.redAccent
            ),
          ),

          Card(
            child: ListTile(
              leading: Text('PIZZA    '),
              trailing: Icon(Icons.favorite),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Column(

              children: [
                Card(
                  child: RichText(
                    text: TextSpan(
                      text: 'Ingredients',
                      style: TextStyle(color: Colors.red, fontSize: 18.0),

                    ),
                  ),
                ),
                ListTile(
                  leading: Text('1)'),
                  title: Text('500 gram of Flour'),

                ),

                ListTile(
                  leading: Text('2)'),
                  title: Text('2 tablespoon of olive oil'),

                ),
                ListTile(
                  leading: Text('3)'),
                  title: Text('half cup of water'),

                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                      height: 5,
                      color: Colors.redAccent
                  ),
                ),

                Text(re2, overflow: TextOverflow.clip,)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
                height: 5,
                color: Colors.redAccent
            ),
          ),

        ],
      ),





    );
  }





}