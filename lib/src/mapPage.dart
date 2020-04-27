import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:history_go/src/workerData.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kStockholm = CameraPosition(
    target: LatLng(59.3253159, 18.0398813),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context){
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kStockholm,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      );
  }
}

class NavBar extends StatefulWidget {
  NavBar({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final List<Widget> _navBarWidgets = [
    MapPage(),
    MissionsWidget(Colors.orange),
    ProfileWidget(Colors.indigo),
    SearchWidget(Colors.green)
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navBarWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[800],
          iconSize: 28.0,
          onTap: _onTabTapped,
        ),
    );
  }
}

//Placeholder Missions
class MissionsWidget extends StatelessWidget {
  final Color color;

  MissionsWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Missions',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

//Placeholder Profile
class ProfileWidget extends StatelessWidget {
  final Color color;

  ProfileWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

//Placeholder Search
class SearchWidget extends StatelessWidget {
  final Color color;

  SearchWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Search',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}