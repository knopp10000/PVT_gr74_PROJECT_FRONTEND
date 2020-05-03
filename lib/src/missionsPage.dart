import 'package:flutter/material.dart';

class MissionsPage extends StatelessWidget {
  final Color color;

  MissionsPage(this.color);

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