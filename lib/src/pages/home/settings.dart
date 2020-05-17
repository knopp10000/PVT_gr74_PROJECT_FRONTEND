import 'package:flutter/material.dart';
import 'package:history_go/src/components/buttons.dart';
import 'package:history_go/src/components/custom_app_bar.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);
  final String title = 'Settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Inställningar"),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: <Widget>[
              Button('Aviseringar', onPressed: () {}),
              Button('Konto', onPressed: () {}),
              Button('Sekretess', onPressed: () {}),
              Button('Säkerhet', onPressed: () {}),
              SignOutButton(text: 'Logga ut'),
            ],
          ),
        ),
      ),
    );
  }
}