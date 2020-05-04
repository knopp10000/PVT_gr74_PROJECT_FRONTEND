import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Color color;

  ProfilePage(this.color);

  @override
  Widget build(BuildContext context) {

    final text = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Profilnamn',
        style: TextStyle(fontSize: 30.0, color: Colors.white),
      ),
    );

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

    final vanner = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.only(left: 120.0, right: 120.0, top: 15.0, bottom: 15.0),
        child: Text('Mina vänner', style: TextStyle(color: Colors.white)),
      ),
    );

    final badges = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.only(left: 120.0, right: 120.0, top: 15.0, bottom: 15.0),
        child: Text('Mina badges', style: TextStyle(color: Colors.white)),
      ),
    );

    final bidrag = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.only(left: 120.0, right: 120.0, top: 15.0, bottom: 15.0),
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
        children: <Widget>[text, picture, vanner, badges, bidrag],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
  }
