import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:history_go/src/pages/home/newMission.dart';

class MissionsPage extends StatelessWidget {

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

  Widget _missionButton(String title, BuildContext context) {
    return Container(
        width: 280.0,
        height: 55.0,
        margin: EdgeInsets.all(8.0),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewMission()));
          },
          color: Colors.red[200],
          child: Text(title, style: TextStyle(color: Colors.white)),
        ));
  }

  Widget _actionButton(String title, Color color) {
    return Container(
      width: 330.0,
      height: 60.0,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: color,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _missionListView(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.only(top: 8.0, bottom: 12.0, left: 20.0, right: 20.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: new BoxDecoration(
        color: Colors.white54
            .withOpacity(0.3), //new Color.fromRGBO(255, 0, 0, 0.0),
        borderRadius: new BorderRadius.all(Radius.circular(12)),
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const Text(
            'Populära uppdrag nära dig',
            style: TextStyle(fontSize: 22.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          _missionButton('Stockholms blodbad', context),
          _missionButton('Runda 2', context),
          _missionButton('Runda 3', context),
          _missionButton('Runda 4', context),
          _missionButton('Runda 5', context),
          _missionButton('Runda 6', context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar('Uppdrag'),
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
              _missionListView(context),
              _actionButton('Skapa nytt uppdrag', Colors.deepOrangeAccent),
              _actionButton('Utförda uppdrag', Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
