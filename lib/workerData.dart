import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CoWorker{

  String username; 
  //home/office/unknown
  WorkerLocations location;
  DateTime lastUpdate; 

  CoWorker({
    this.username, 
    this.location,
    this.lastUpdate
  });

}

class Location extends LatLng{
  Location(double latitude, double longitude) : super(latitude, longitude);

  Location.fromLatLng(LatLng x): super(x.latitude, x.longitude);

  Location.fromJson(Map<String, dynamic> json)
      : super(json['latitude'] as double, json['longitude'] as double);

  Map<String, dynamic> toJson() =>
    {
      'latitude': latitude,
      'longitude': longitude,
    };
  
}

enum WorkerLocations{
  home, office, unknown
}

class StalkerModel{
  List<CoWorker> coWorkers;
  CoWorker myself;
  //home location
  Location homeLocation;
  //work location
  Location workLocation;

  StalkerModel(){
    myself = new CoWorker(username: 'Donny', location: WorkerLocations.unknown, lastUpdate: DateTime.now());
    loadData();
    updateWorkers();
  }

  void updateWorkers(){
      coWorkers = fakeCoWorkers;
  }

  void saveData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('username', myself.username);
     await prefs.setString('lastUpdated', myself.lastUpdate.toIso8601String());
     await prefs.setString('homeLocation', json.encode(homeLocation));
     await prefs.setString('workLocation', json.encode(workLocation));
  }

  void loadData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myself.username = prefs.getString('username') ?? '';
    final String tempDate = prefs.getString('lastUpdated') ?? '';
    if(tempDate != '' && tempDate != 'null'){
      myself.lastUpdate = DateTime.parse(tempDate);
    }

    final String tempHome = (prefs.getString('homeLocation') ?? '');
    if(tempHome != '' && tempHome != 'null'){
      Map jsonHome = jsonDecode(tempHome);
      homeLocation = Location.fromJson(jsonHome);
    }

    final String tempWork = (prefs.getString('workLocation') ?? '');
    if(tempWork != '' && tempWork != 'null'){
      Map jsonWork = jsonDecode(tempWork);
      workLocation = Location.fromJson(jsonWork);
    }
    
    


  }


}


final fakeCoWorkers = [
  new CoWorker(
    username: "Razan",
    location: WorkerLocations.office,
    lastUpdate: DateTime.now() 
  ),
  new CoWorker(
    username: "Barry",
    location: WorkerLocations.office,
    lastUpdate: DateTime.parse("2020-01-20 14:23:04Z") 
  ), 
  new CoWorker(
    username: "Airi",
    location: WorkerLocations.unknown,
    lastUpdate: DateTime.parse("2020-01-19 10:10:04Z") 
  ), 
  new CoWorker(
    username: "Jakob",
    location: WorkerLocations.home,
    lastUpdate: DateTime.parse("2020-01-15 22:10:04Z") 
  ), 
  new CoWorker(
    username: "Katie",
    location: WorkerLocations.unknown,
    lastUpdate: DateTime.parse("2020-01-22 09:01:04Z") 
  )
];