import 'package:flutter/material.dart';
import 'package:history_go/src/pages/pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_play),
            title: Text('Missions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
        currentIndex: _currentTab,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[800],
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
      ),
      body: IndexedStack(
        children: <Widget>[
          MapPage(),
          MissionsPage(),
          ProfilePage(),
          SearchPage(),
        ],
        index: _currentTab,
      ),
    );
  }
}
