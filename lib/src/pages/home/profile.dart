import 'package:flutter/material.dart';
import 'package:history_go/src/pages/pages.dart';

class ProfilePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final app = AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        'Profilnamn',
        style: TextStyle(fontSize: 26.0),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        )
      ],
    );
/*
    final text = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Profilnamn',
        style: TextStyle(fontSize: 30.0, color: Colors.white),
      ),

    );
*/
    final picture = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 120.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/kaknas.jpg'),
        ),
      ),
    );

    final vanner = Container(
      width: 330.0,
      height: 60.0,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        child: Text('Mina vänner', style: TextStyle(color: Colors.white)),
      ),
    );

    final badges = Container(
      width: 330.0,
      height: 60.0,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        child: Text('Mina badges', style: TextStyle(color: Colors.white)),
      ),
    );

    final bidrag = Container(
      width: 330.0,
      height: 60.0,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        child: Text('Mina bidrag', style: TextStyle(color: Colors.white)),
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
        children: <Widget>[app, picture, vanner, badges, bidrag],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
