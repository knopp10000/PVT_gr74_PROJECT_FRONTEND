import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:history_go/src/pages/pages.dart';

class InfoPage extends StatelessWidget {
  Place place;

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
              images: [place.img],
            )
        ),
      );
    }

    Widget _infoText() {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Text( place.description,
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {

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