import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class InfoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final name = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Kakästornet',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final info = Hero(
      tag: 'kaknästornet',
      child: SizedBox(
          height: 400.0,
          width: 300.0,
          child: Carousel(
            autoplay: false,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 2000),
            images: [
              ExactAssetImage("assets/kaknas.jpg"),
              ExactAssetImage("assets/kaknas2.jpg"),
              ExactAssetImage("assets/kaknas3.jpg")
            ],
          )
      ),

      );


    final text = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Kaknästornet är ett torn på Ladugårdsgärdet i Stockholm och är centrum i radio- och TV-nätet för Teracoms radio- och TV-trafik i Sverige. Namnet kommer från Kaknäs, en av fyra kungsgårdar som låg här. Tornet har en höjd av 155 meter (170 meter inklusive masten) och 34 våningar.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[info, name, text],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}