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
    return Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kStockholm,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )
    );
  }
}