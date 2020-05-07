import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        'Inställningar',
        style: TextStyle(fontSize: 26.0),
      ),
      actions: <Widget>[],
    );

    final inst1 = Container(
      width: 400.0,
      height: 75.0,
      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 15.0, bottom: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        child: Text('Aviseringar', style: TextStyle(color: Colors.white)),
      ),
    );

    final inst2 = Container(
      width: 400.0,
      height: 65.0,
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        child: Text('Konto', style: TextStyle(color: Colors.white)),
      ),
    );

    final inst3 = Container(
      width: 400.0,
      height: 65.0,
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        child: Text('Sekretess', style: TextStyle(color: Colors.white)),
      ),
    );

    final inst4 = Container(
      width: 400.0,
      height: 65.0,
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        child: Text('Säkerhet', style: TextStyle(color: Colors.white)),
      ),
    );

    final inst5 = Container(
      width: 400.0,
      height: 65.0,
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        child: Text('Om', style: TextStyle(color: Colors.white)),
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
        children: <Widget>[app, inst1, inst2, inst3, inst4, inst5],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
