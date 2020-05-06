import 'package:flutter/material.dart';
import 'package:history_go/src/login/loginPage.dart';
import 'package:history_go/src/login/signupPage.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _loginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.deepPurple[300],
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.deepPurple),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        testBackend();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Sign up',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepPurpleAccent,
                    Colors.deepPurpleAccent[100]
                  ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 100,
              ),
              _loginButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton()
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> testBackend() async {
  //var url = 'http://localhost:8080/getPlace?lats=59.321&lats=18.095';
  var url = 'https://group4-75.pvt.dsv.su.se/getPlace?lats=59.321&lats=18.095';
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    print('Response body: ${response.body}');
    print('\nJson body: ${jsonResponse["result"]["records"][1]["record"]["@graph"]}');
  }else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
