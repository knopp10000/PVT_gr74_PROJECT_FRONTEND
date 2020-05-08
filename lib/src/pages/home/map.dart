import 'dart:async';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  static final CameraPosition _kStockholm = CameraPosition(
    target: LatLng(59.314323787178985, 18.085596598684788),
    zoom: 12,
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
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[selectedMarker] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueMagenta,
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
          onTap: () => Navigator.pushNamed(context, "/info", arguments: place)
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
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
      debugPrint(p.toString());
    }
    //addMarker(const LatLng(59.327, 18.0398813));
  }

  void getPlaces() async {
    //var url = 'http://localhost:8080/getPlaces?lat=59.321&lon=18.095';
    var url = 'https://group4-75.pvt.dsv.su.se/getPlaces?lat=59.321&lon=18.095';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      //print('Response body: ${response.body}');
      debugPrint('\nJson body: ${jsonResponse[0]["desc"]}');

      print(jsonResponse.length);
      setState(() {
      for (var obj in jsonResponse) {
        double lat = double.parse(obj["lat"]);
        double lon = double.parse(obj["lon"]);
        String title = obj["title"];
        String desc = obj["desc"];
        String urlString = obj["img"];
        Image img = new Image.network(urlString);

        places.add(new Place(new LatLng(lat, lon), "test", img, desc));
        places.add(new Place(
        LatLng(59.327, 18.0398813),
        'place test 1',
        Image.network(
            'http://kmb.raa.se/cocoon/bild/raa-image/16001000018011/normal/1.jpg'),
        'beskrivning blabla'));
      }
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    setMarkers();
    return;
  }
}

class Place {
  LatLng position;
  String name;
  Image img;
  String description;

  Place(this.position, this.name, this.img, this.description);

  @override
  String toString() {
    return "name: " +
            name +
            " position:" +
            position.toString() +
            "description: " +
            description ??
        "no description.";
  }
}
