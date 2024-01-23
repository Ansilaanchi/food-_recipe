import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StackData extends StatelessWidget {
  final String recipeId; // Your user ID

  StackData(this.recipeId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECIPIES '),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('stackColumn').doc(recipeId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show a loading indicator while fetching data
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Text('No data found!'); // If document doesn't exist
          }

          // Access and use the data here
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return  SingleChildScrollView(
            child: Container(
              // height: double.infinity,
              width: double.infinity,
              color: Color.fromARGB(255, 238, 244, 247),
              child: Column(
                // verticalDirection: VerticalDirection.down,
                children: [
                  Text(
                    data["recipeName"] ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        data["image"] ?? "",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 25,
                    width: double.infinity,
                                      // color: const Color.fromARGB(255, 224, 206, 212),
                        color: Color.fromARGB(255, 238, 244, 247),
            
                    child: Center(
                      child: Text(
                        "INGREDIENTS",
                        style: TextStyle(fontWeight: FontWeight.w500,),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                                color: Color.fromARGB(255, 238, 244, 247),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data["ingredients"].length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(data["ingredients"][index].toString()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
            
                  Container(
                      height: 25,
                    width: double.infinity,
                            //  color: Color.fromARGB(255, 222, 215, 228),
                        color: Color.fromARGB(255, 238, 244, 247),
            
                    child: Center(
                      child: Text(
                        "INSTRUCTIONS",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,                           
                            //  color: Color.fromARGB(255, 222, 215, 228),
                        color: Color.fromARGB(255, 238, 244, 247),
            
                    child: Text(data["instructions"] ?? "")),
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}


