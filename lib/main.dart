import 'package:flutter/material.dart';
import 'package:history_go/src/pages/pages.dart';


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
      initialRoute: '/welcome',
      routes: {
        '/welcome' : (context) => WelcomePage(),
        '/login' : (context) => LoginPage(),
        '/signup' : (context) => SignUpPage(),
        '/home' : (context) => HomePage(),
        '/map' : (context) => MapPage(),
        '/info' : (context) => InfoPage(),
        '/missions' : (context) => MissionsPage(),
        '/permissions' : (context) => PermissionPage(),
        '/profile' : (context) => ProfilePage(),
        '/search' : (context) => SearchPage(),
        '/settings' : (context) => SettingsPage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name,
        )),
    );
  }
}

class UndefinedView extends StatelessWidget {
  final String name;
  const UndefinedView({Key key, this.name}) : super(key: key);  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $name is not defined'),
      ),
    );
  }
}
