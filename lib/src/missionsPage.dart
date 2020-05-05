import 'package:flutter/material.dart';

class MissionsPage extends StatelessWidget {
  final Color color;

  MissionsPage(this.color);

  @override
  Widget build(BuildContext context) {

    final text1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Populära uppdrag nära dig',
        style: TextStyle(fontSize: 25.0, color: Colors.white),
      ),
    );

    final runda1 = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.only(left: 130.0, right: 130.0, top: 15.0, bottom: 15.0),
        child: Text('Runda 1', style: TextStyle(color: Colors.white)),
      ),
    );

    final runda2 = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.only(left: 130.0, right: 130.0, top: 15.0, bottom: 15.0),
        child: Text('Runda 2', style: TextStyle(color: Colors.white)),
      ),
    );

    final runda3 = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.only(left: 130.0, right: 130.0, top: 15.0, bottom: 15.0),
        child: Text('Runda 3', style: TextStyle(color: Colors.white)),
      ),
    );

    final runda4 = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.only(left: 130.0, right: 130.0, top: 15.0, bottom: 15.0),
        child: Text('Runda 4', style: TextStyle(color: Colors.white)),
      ),
    );

    final container = Container(
      //padding: const EdgeInsets.all(32.0),
        height: 320.0,
        margin: const EdgeInsets.only(bottom: 5.0),
        decoration: new BoxDecoration(
            color: Colors.white70.withOpacity(0.3), //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: new BorderRadius.only(
                topLeft:  const  Radius.circular(40.0),
                topRight: const  Radius.circular(40.0),
                bottomLeft:  const  Radius.circular(40.0),
                bottomRight: const  Radius.circular(40.0))
        ),
        child: Column(
            children: <Widget>[text1, runda1, runda2, runda3, runda4],
        )
    );

    final skapa = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.deepOrangeAccent,
        padding: EdgeInsets.only(left: 100.0, right: 100.0, top: 15.0, bottom: 15.0),
        child: Text('Skapa nytt uppdrag', style: TextStyle(color: Colors.white)),
      ),
    );

    final avklarade = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.red,
        padding: EdgeInsets.only(left: 75.0, right: 75.0, top: 15.0, bottom: 15.0),
        child: Text('Alla mina avklarade uppdrag', style: TextStyle(color: Colors.white)),
      ),
    );

    final noName = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed();
        },
        color: Colors.green,
        padding: EdgeInsets.only(left: 107.0, right: 107.0, top: 15.0, bottom: 15.0),
        child: Text('Inte namngiven än', style: TextStyle(color: Colors.white)),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[container, skapa, avklarade, noName],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
