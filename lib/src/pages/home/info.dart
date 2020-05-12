import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:history_go/src/pages/pages.dart';

class InfoPage extends StatelessWidget {
  Place place;

  Widget _appBar(String title) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        title,
        style: TextStyle(fontSize: 26.0),
      ),
      actions: <Widget>[],
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
            images: place.images,
          )),
    );
  }

  Widget _infoText(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
  }

  Widget noPlacePage(BuildContext context) {
    return Scaffold(
      appBar: _appBar('Ingen plats'),
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
              _infoText('Plats saknas.'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;

    place = settings.arguments;

    if (place == null)
      return noPlacePage(context);
    else {
      return Scaffold(
        appBar: _appBar(place.name),
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
                _infoPicture(),
                _infoText(place.description),
              ],
            ),
          ),
        ),
      );
    }
  }
}
