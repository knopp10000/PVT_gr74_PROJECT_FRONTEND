import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:history_go/src/pages/pages.dart';

class InfoPage extends StatelessWidget {

  Widget _appBar(String title) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(title, style: TextStyle(fontSize: 26.0),),
      actions: <Widget>[
      ],
    );
  }

    Widget _infoPicture() {
      return Hero(
        tag: 'infoPic',
        child: SizedBox(
            height: 350.0,
            width: 280.0,
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
    }

    Widget _infoText() {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Kaknästornet är ett torn på Ladugårdsgärdet i Stockholm och är centrum i radio- och TV-nätet för Teracoms radio- och TV-trafik i Sverige. Namnet kommer från Kaknäs, en av fyra kungsgårdar som låg här. Tornet har en höjd av 155 meter (170 meter inklusive masten) och 34 våningar.',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      Place place;

      RouteSettings settings = ModalRoute.of(context).settings;
      place = settings.arguments;

      if(place != null){
        return Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(28.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.lightBlueAccent,
                ]),
              ),
              child: Column(
                children: <Widget>[
                  _appBar('${place.name}'),
                  _infoPicture(),
                  _infoText(),
                ],
              ),
            ),
          ),
        );
      }else{
        return Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(28.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.lightBlueAccent,
                ]),
              ),
              child: Column(
                children: <Widget>[
                  _appBar('Ingen plats'),
                  _infoPicture(),
                  _infoText(),
                ],
              ),
            ),
          ),
        );
      }
    }
  }