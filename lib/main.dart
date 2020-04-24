import 'package:flutter/material.dart';
import 'main_map.dart';
import 'workerData.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dotenv/dotenv.dart' show load, env;

void main() {
  load();
  runApp(HistoryGo());
}

class HistoryGo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'History Go!',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LogInPage(title: 'Log in'),
    );
  }

}

class LogInPage extends StatefulWidget {
  LogInPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  StalkerModel _stalkerModel = new StalkerModel();
  String apiKey = env['API_KEY'];

  void _incrementCounter() {
    setState(() {});
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
          ]),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _stalkerModel.coWorkers.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 65,
                color: Colors.purple,
                child: ListTile(
                  leading: _stalkerModel.coWorkers[index].location ==
                          WorkerLocations.home
                      ? new Icon(Icons.home)
                      : _stalkerModel.coWorkers[index].location ==
                              WorkerLocations.office
                          ? new Icon(Icons.business_center)
                          : new Icon(Icons.not_listed_location),
                  title: Text('${_stalkerModel.coWorkers[index].username}'),
                  subtitle: Text(
                      'Hours since update: ${DateTime.now().difference(_stalkerModel.coWorkers[index].lastUpdate).inHours}'),

                ),

            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add_to_home_screen)),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.location_searching),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
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
  void openPage(BuildContext context) {

    Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainMap()));
  }
}
