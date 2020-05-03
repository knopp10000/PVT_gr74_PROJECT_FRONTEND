import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Color color;

  ProfilePage(this.color);

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