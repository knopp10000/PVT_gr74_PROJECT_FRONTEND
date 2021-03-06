import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(this.text, {this.onPressed, this.color});
  
  final String text;
  final GestureTapCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: RawMaterialButton(
        elevation: 4.0,
        fillColor: color??Theme.of(context).buttonColor,
        splashColor: Theme.of(context).splashColor,
        onPressed: onPressed ??() {},
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        constraints: BoxConstraints(
          minWidth: 330.0,
          minHeight: 50.0,
        ),
        textStyle: Theme.of(context).textTheme.button,
        child: Text(text),
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  SignOutButton({this.text});
  final String text;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Button(
      text,
      onPressed: () {
        try {
          _auth.signOut().whenComplete(() {
            Navigator.maybePop(context);
          });
        } catch (e) {
          print(e);
        }
      },
    );
  }
}

class CustomBackButton extends StatelessWidget {
  CustomBackButton({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
