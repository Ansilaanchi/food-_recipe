import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie_zone/HomePage/carousel_slide.dart';
import 'package:foodie_zone/HomePage/cooking.dart';
import 'package:foodie_zone/HomePage/searchKey.dart';
import 'package:foodie_zone/HomePage/stack.dart';
import 'package:foodie_zone/HomePage/topRowSlide.dart';
import 'package:foodie_zone/HomePage/trending.dart';
import 'package:foodie_zone/drawerPage/drawerPage.dart';
// import 'package:foodie_zone/navigatePages/favourite.dart';
import 'package:foodie_zone/navigatePages/navigate.dart';
// import 'package:foodie_zone/otherPage/items.dart';
import 'package:foodie_zone/services/model/favoriteModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePagrState();
}

class _HomePagrState extends State<HomePage> {
  List<bool> isSelectedList = List.generate(
      6, (index) => false); // Create a list to track individual selections

  List<String> imagesList = [
    'assets/Cabbage-sabzi-1.jpg',
    'assets/rice paneer.jpg',
    'assets/egg-muffins-1-16.jpg',
    'assets/vegan-taco-meat-healthy.jpg',
    'assets/manicotti.jpg',
    'assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg',
  ];
  List<String> textList = [
    'Cabbage Sabzi',
    ' Rice Kheer ',
    ' Egg Muffins',
    'Vagan Tacos',
    ' Manicotti ',
    ' Katori Chaat',
  ];
  
  List<String> text1List = [
    'Tasty and \n Make easy',
    'Yummy..',
    'smoothyy ',
    'Tasty and \n Make easy',
    'Yummy..',
    'smoothyy',
  ];
  List<String> text2List = [
    '4.4',
    '3.0',
    '3.5',
    '4.4',
    '3.0',
    '3.5',
  ];

  
  
List <FavoriteItemm>favoriteItems = [
  FavoriteItemm(
    image: 'assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg',
    textList: 'Gulgul_Barane',
    text1List: 'Tasty and \n Make easy',
    text2List: '4.4',
  ),
  FavoriteItemm(
    image: 'assets/HD-wallpaper-delicious-food-meal-dish-delicious-food-fries-meat-vegetables.jpg',
    textList: 'Gulgul_Barane',
    text1List: 'Tasty and \n Make easy',
    text2List: '4.4',
  ),
  // Add more FavoriteItem objects as needed
];
  // int currentTab = 0;

Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:DrawerPage(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Have a nice day..!",
          style: GoogleFonts.whisper(
            fontSize: 50,
            color: const Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      bottomNavigationBar: Newbarr(context) ,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:TopRowSlide()
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            SerachKey(),
           
            const SizedBox(
              height: 25,
            ),

            CookingDay(context),                 

            Container(
              width: double.infinity,
              height: 300,
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: imagesList.length,
                itemBuilder: (context, index) {
                  return stackRow(imagesList[index], textList[index],
                      text1List[index], text2List[index], () {
                  
                  
                  }, index);
                },
              ),
            ),

            Trending(context),
           
            carousel_slider(context),
          ],
        ),
      ),

    );
  }

  Type NavigationBar() => NavigationBar();


  GestureDetector stackRow(
    String image, String textList, String text1List,
    String text2List, Function()? onTap, int index
  ) {
    return GestureDetector(
      onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>StackColumn()));

      //   setState(() {
      //     isSelectedList[index] = !isSelectedList[index];

      //     if (isSelectedList[index]) {
      //       // Add to favorites
      //       favoriteItems.add(FavoriteItemm(
      //         image: image,
      //         textList: textList,
      //         text1List: text1List,
      //         text2List: text2List,
      //       ));
      //     } else {
      //       // Remove from favorites
      //       favoriteItems.removeWhere((item) => item.image == image);
      //     }
      //   });

      //   // Call the additional onTap function if provided
      //   if (onTap != null) {
      //     onTap();
      //   }
      },


      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 500,
            ),
            Positioned(
              top: 35,
              // left: 10,
              child: Container(
                width: 200,
                height: 240,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 235, 168, 168),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Positioned(
              left: 40,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(image),
              ),
            ),
            // Positioned(
            //   top: 40,
            //   left: 160,
            //   child: IconButton(
            //     onPressed: onTap,
            //     icon: Icon(
            //       Icons.favorite,
            //       size: 25,
            //        color: isSelectedList[index]
            //           ? Color.fromARGB(255, 252, 41, 4)
            //           : Color.fromARGB(255, 117, 137, 150),
            //     ),
            //   ),
            // ),
            Positioned(
                top: 120,
                left: 20,
                child: Text(
                  textList,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
              top: 220,
              left: 150,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images (1).png"),
              ),
            ),
            Positioned(
                top: 150,
                left: 20,
                child: Text(
                  text1List,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
              top: 230,
              left: 20,
              child: Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              ),
            ),
            Positioned(
                top: 230,
                left: 40,
                child: Text(
                  text2List,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}




class YourItemType {
  final String image;
  final String textList;
  final String text1List;
  final String text2List;

  YourItemType({
    required this.image,
    required this.textList,
    required this.text1List,
    required this.text2List,
  });
}

//  ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => StackColumn(),
                    //         // FavoritePage(favoriteItems:favoriteItems ),
                    //       ),
                    //     );
                    //   },
                    //   child: Column(children: [
                    
                    //   ],),
                    // );
                    
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Items()));

  // GestureDetector stackRow(
  //   String image, String textList, String text1List,
  //     String text2List, Function()? onTap, int index
  //     ) {
  //   return  GestureDetector(
  //      onTap: () {
  //     setState(() {
  //       isSelectedList[index] = !isSelectedList[index];

  //       if (isSelectedList[index]) {
  //         // Add to favorites
  //         FavoriteItemm.add(FavoriteItem(
  //           image: image,
  //           textList: textList,
  //           text1List: text1List,
  //           text2List: text2List,
  //         ));
  //       } else {
  //         // Remove from favorites
  //         FavoriteItemm.removeWhere((item) => item.image == image);
  //       }
  //     });

      // Call the additional onTap function if provided
      // if (onTap != null) {
        // onTap();
      // }
    // },
    // onTap: () {
    //   setState(() {
    //     isSelectedList[index] = !isSelectedList[index];

    //     if (isSelectedList[index]) {
    //       // Add to favorites
    //       favoriteItems.add(yourItemList[index]);
    //     } else {
    //       // Remove from favorites
    //       favoriteItems.remove(yourItemList[index]);
    //     }
    //   });

    //   // Call the additional onTap function if provided
    //   if (onTap != null) {
    //     onTap();
    //   }
    // },




//  'https://hebbarskitchen.com/wp-content/uploads/mainPhotos/cabbage-sabzi-recipe-cabbage-curry-cabbage-ki-sabzi-north-indian-style-1-696x927.jpeg',   'assets/photos-2015-1-11-10-4-51.jpg',
//     'https://theazizkitchen.com/wp-content/uploads/2021/03/image_11.jpg',
//     'https://cafedelites.com/wp-content/uploads/2018/01/Egg-Cups-IMAGE-25.jpg',
//     'https://detoxinista.com/wp-content/uploads/2018/05/vegan-tacos.jpg',
//     'https://www.allrecipes.com/thmb/rcaP-8yExlMhpoxu36Reoa_Ddig=/771x514/filters:no_upscale():max_bytes(150000):strip_icc():focal(1015x736:1017x738):format(webp)/144650_TacoPie4x3photobyShalaine_1-98d0b65da336406da3795a87b3c8d8fe.jpg',
//     'https://hebbarskitchen.com/wp-content/uploads/mainPhotos/katori-chaat-recipe-chaat-katori-recipe-how-to-make-tokri-chaat-1-696x927.jpeg',
//   ];
//   List<String> textList = [
//     'Cabbage Sabzi',
//     ' Rice Kheer ',
//     ' Egg Muffins',
//     'Vagan Tacos',
//     ' Manicotti ',
//     ' Katori Chaat',