import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

    Widget _appBar(String title) {
      return AppBar(
        backgroundColor: Colors.blue,
        title: Text(title, style: TextStyle(fontSize: 26.0),),
        actions: <Widget>[
        ],
      );
    }

    Widget _settingsButton(String title) {
      return Container(
        width: 400.0,
        height: 75.0,
        padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 15.0, bottom: 4.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
            //Navigator.of(context).pushNamed();
          },
          color: Colors.lightBlueAccent,
          child: Text(title, style: TextStyle(color: Colors.white)),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
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
                _appBar('Inställningar'),
                _settingsButton('Aviseringar'),
                _settingsButton('Konto'),
                _settingsButton('Sekretess'),
                _settingsButton('Säkerhet'),
                _settingsButton('Om'),
              ],
            ),
          ),
        ),
      );
    }
  }
