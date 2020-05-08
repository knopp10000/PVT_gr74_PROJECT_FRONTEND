import 'package:flutter/material.dart';
import 'package:history_go/src/pages/pages.dart';


class ProfilePage extends StatelessWidget {
  final Color color;

  ProfilePage(this.color);

  Widget _appBar(String title) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(title, style: TextStyle(fontSize: 26.0),),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        )
      ],
    );
  }

  Widget _profileButton(String title) {
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
        color: Colors.lightBlueAccent,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _profilePicture() {
    return Hero(
      tag: 'profilBild',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 120.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/kaknas.jpg'),
        ),
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
              _appBar('Profilnamn'),
              _profilePicture(),
              _profileButton('Mina vänner'),
              _profileButton('Mina badges'),
              _profileButton('Mina bidrag'),
            ],
          ),
        ),
      ),
    );
  }
}