import 'package:flutter/material.dart';

class TitleLogo extends StatelessWidget {
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'History ',
          style: TextStyle(
              color: Colors.orange, fontSize: 40, fontWeight: FontWeight.w700),
          children: [
            TextSpan(
              text: 'Go',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
            ),
            TextSpan(
              text: '!',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _title();
  }
}
