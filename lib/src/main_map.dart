import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:history_go/src/workerData.dart';

class MainMapPage extends StatefulWidget {
  MainMapPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainMapPageState createState() => _MainMapPageState();
}

class _MainMapPageState extends State<MainMapPage> {
  //StalkerModel _stalkerModel = new StalkerModel();
  //final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.tag_faces),
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'Boy its empty here..',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
        ),
    );
  }
}