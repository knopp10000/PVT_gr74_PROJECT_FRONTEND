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

  static LatLng _initPosition;

  static const CameraPosition _gurras_torg = CameraPosition(
    target: LatLng(59.329, 18.068),
    zoom: 16,
  );

  @override
  void initState() {
    super.initState();
    _getUserPosition();
    getPlaces();
  }

  void _getUserPosition() async {
    Position position = await Geolocator().getCurrentPosition();
    List<Placemark> placemark =
        await Geolocator().placemarkFromPosition(position);
    setState(() {
      _initPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
    });
  }

  Widget _settingsButton() {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 2),
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/settings");
        },
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.settings,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initPosition == null
          ? Container(
              child: Center(
                child: Text(
                  'loading map..',
                  style: TextStyle(
                      fontFamily: 'Avenir-Medium', color: Colors.grey[400]),
                ),
              ),
            )
          : Container(
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      setState(() {
                        _controller.complete(controller);
                      });
                    },
                    initialCameraPosition: CameraPosition(
                      target: _initPosition,
                      zoom: 14.4,
                    ),
                    mapType: MapType.normal,
                    markers: Set<Marker>.of(markers.values),
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(8.0) + MediaQuery.of(context).padding,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: <Widget>[
                          _settingsButton(),
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
          final Marker resetOld = markers[selectedMarker].copyWith(
              iconParam: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen));
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
      List<dynamic> jsonResponse =
          convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
      debugPrint('\nJson body: ${jsonResponse[0]} \n');
      debugPrint(
          "json response längd: " + jsonResponse.length.toString() + "\n");
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
            description +
            "\n" ??
        "no description.\n";
  }
}
