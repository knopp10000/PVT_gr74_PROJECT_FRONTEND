import 'package:flutter/material.dart';
//import 'package:google_map_location_picker/google_map_location_picker.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:dotenv/dotenv.dart' show load, env;

import 'src/welcomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //This is the root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'History Go!',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: WelcomePage(),
    );
  }
}
