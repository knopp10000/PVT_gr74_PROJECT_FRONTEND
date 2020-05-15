import 'package:flutter/material.dart';
import 'package:history_go/src/models/user.dart';


class ProfilePage extends StatelessWidget {

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
          backgroundImage: UserInfo.img ?? AssetImage('assets/kaknas.jpg'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          UserInfo.name ?? 'Profil',
          style: TextStyle(fontSize: 26.0, letterSpacing: 0.8),
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
      ),
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
