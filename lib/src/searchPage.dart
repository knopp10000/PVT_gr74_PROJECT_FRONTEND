import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final Color color;

  SearchPage(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Search',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}