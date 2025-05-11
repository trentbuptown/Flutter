import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

var bannerItems = ["Burger", "Cheese Chilly", "Noodles", "Pizza"];
var bannerImages = [
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/pizza.jpg",
];

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                        Text("Foodies", style: TextStyle(fontSize: 55, fontFamily: "Samantha"),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.person))
                      ],
                    ),
                    ),
                    BannerWidgetArea()
                  ],

                ),
              )),
        ),
    );
  }

}

class BannerWidgetArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller = PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = [];

    for(int x=0;x<bannerItems.length; x++ ){
      var bannerView = Padding(padding: EdgeInsets.all(10.0),
      child: Container(
          child: Stack(
          fit: StackFit.expand,
          children:<Widget>[

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
            ),

            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Image.asset(
                bannerImages[x],
                fit: BoxFit.cover,
            )
            )
          ],
      ),
      ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth*9/16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,

      )
    );
  }
}

