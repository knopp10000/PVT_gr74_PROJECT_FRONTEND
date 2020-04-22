import 'package:flutter/material.dart';
import 'workerData.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVT Stalker',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Where Is Everyone?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  StalkerModel _stalkerModel = new StalkerModel();
  String apiKey = '_________________';

  void _incrementCounter() {
    setState(() {
       _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
     return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings_applications),
              tooltip: 'Settings',
              onPressed: () {
                openPage(context);
              },
            ),
    ]
      ),
      body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _stalkerModel.coWorkers.length, 
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 65,
                  color: Colors.amber,
                  child: ListTile(
                        leading: _stalkerModel.coWorkers[index].location==WorkerLocations.home?new Icon(Icons.home):_stalkerModel.coWorkers[index].location==WorkerLocations.office?new Icon(Icons.business_center):new Icon(Icons.not_listed_location),
                        title: Text('${_stalkerModel.coWorkers[index].username}'),
                        subtitle: Text('Hours since update: ${DateTime.now().difference(_stalkerModel.coWorkers[index].lastUpdate).inHours}'),
                        
                  )
                );
              }
           ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add_to_home_screen)
      ), 
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.location_searching),
              onPressed: (){},
            ),
            IconButton(icon: Icon(Icons.refresh),
              onPressed: (){
                setState(() {
                  _stalkerModel.coWorkers.shuffle();  
                });
              },
            ),
          ],
          ),
      ),
    );
  }

  //SETTINGS PAGE 
  void openPage(BuildContext context){
      final _usernameController = TextEditingController();
      _usernameController.text = _stalkerModel.myself.username;
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Settings Page'),
                ),
                 body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Set Username',
                      ),
                      TextFormField(
                          controller: _usernameController,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'What do people call you?',
                            labelText: 'Name *',
                          ),
                          validator: (String value) {
                            if(value.isEmpty){
                              return 'You need a username!';
                            }
                            return value.contains('@') ? 'Do not use the @ char.' : null;
                          },
                        ), 
                        RaisedButton(
                          onPressed: (){
                             String username = _usernameController.text;
                             _stalkerModel.myself.username = username;
                             _stalkerModel.saveData();
                          },
                          child: Text('Save Username'),
                        ), 
                         RaisedButton(
                          onPressed: () async{
                             LocationResult result = await showLocationPicker(context, apiKey);                             
                             //print(' Lat: ${result.latLng.latitude} Long: ${result.latLng.longitude}');
                             _stalkerModel.homeLocation = Location.fromLatLng(result.latLng);
                          },
                          child: Text('Choose Home Location'),
                        ), 
                        RaisedButton(
                          onPressed: () async{
                             LocationResult result = await showLocationPicker(context, apiKey);                             
                             //print(' Lat: ${result.latLng.latitude} Long: ${result.latLng.longitude}');
                             _stalkerModel.workLocation = Location.fromLatLng(result.latLng);
                          },
                          child: Text('Choose Work Location'),
                        )
                    ],
                  ),
                 )
            ); 
        }    
      ));
  }




}
