import 'dart:async';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:history_go/src/pages/pages.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  List<Place> places = new List<Place>();
  int _markerIdCounter = 1;
  MarkerId selectedMarker;

  Position _currentPosition;
  CameraPosition _thisLocation;
  bool foundPosition = false;

  static final CameraPosition _kStockholm = CameraPosition(
    target: LatLng(59.329, 18.068),
    zoom: 16,
  );

  @override
  void initState() {
    super.initState();
    getPlaces();
  }

  Widget button(IconData icon) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsPage()));
      },
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*if (foundPosition == false) {
        _getCurrentLocation();
        if (_currentPosition != null) {
          _goToPosition();
          foundPosition = true;
        }
      } */
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: _kStockholm,
              mapType: MapType.normal,
              markers: Set<Marker>.of(markers.values),
              //myLocationButtonEnabled: true,
              //myLocationEnabled: true,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    button(Icons.settings),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMarkerTapped(MarkerId markerId, Place place) {
    final Marker tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        if (markers.containsKey(selectedMarker)) {
          final Marker resetOld = markers[selectedMarker]
              .copyWith(iconParam: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
          markers[selectedMarker] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueYellow,
          ),
        );
        markers[markerId] = newMarker;
      });
    }
  }

  void addMarker(Place place) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
        markerId: markerId,
        position: place.position,
        infoWindow: InfoWindow(
            title: place.name,
            snippet: place.description ?? 'saknar beskrivning',
            onTap: () =>
                Navigator.pushNamed(context, "/info", arguments: place)),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        onTap: () {
          _onMarkerTapped(markerId, place);
        });
    setState(() {
      markers[markerId] = marker;
    });
  }

  void setMarkers() {
    for (Place p in places) {
      addMarker(p);
    }
  }

  void getPlaces() async {
    //var url = 'http://localhost:8080/getPlaces?lat=59.321&lon=18.095';
    var url = 'https://group4-75.pvt.dsv.su.se/getPlaces?lat=59.329&lon=18.068';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
      debugPrint('\nJson body: ${jsonResponse[0]} \n');
      debugPrint("json response längd: " + jsonResponse.length.toString() + "\n");
      setState(() {
        for (var obj in jsonResponse) {
          double lat = double.parse(obj["lat"]);
          double lon = double.parse(obj["lon"]);
          String title = obj["entries"][0]["title"];
          String desc = obj["entries"][0]["desc"];
          List<Image> images = new List();
          List<dynamic> entries = obj["entries"];
          for (var entry in entries) {
            String urlString = entry["img"];
            images.add(Image.network(urlString));
          }          
          places.add(new Place(new LatLng(lat, lon), title, images, desc));
        }
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    setMarkers();
    return;
  }

  /*getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator.getCurrentPosition().then((Position position) {
      setState(() {
        _currentPosition = position;
        _thisLocation = CameraPosition(
          target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
          zoom: 12,
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> _goToPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(_thisLocation));
  }*/
}

class Place {
  LatLng position;
  String name;
  List<Image> images;
  String description;

  Place(this.position, this.name, this.images, this.description);

  @override
  String toString() {
    return "name: " +
            name +
            " position:" +
            position.toString() +
            "description: " +
            description + "\n" ??
        "no description.\n";
  }
}
