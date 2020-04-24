import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_go/workerData.dart';

class MainMap extends StatefulWidget {
  MainMap({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  StalkerModel _stalkerModel = new StalkerModel();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Set Username',
              ),
              TextFormField(
                controller: _usernameController,
                autovalidate: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'You need a username!';
                  }
                  return value.contains('@')
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              RaisedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  _stalkerModel.myself.username = username;
                  _stalkerModel.saveData();
                },
                child: Text('Save Username'),
              ),
              RaisedButton(
                onPressed: () async {

                },
                child: Text('Choose Home Location'),
              ),
              RaisedButton(
                onPressed: () async {

                },
                child: Text('Choose Work Location'),
              )
            ],
          ),
        ));
  }
}