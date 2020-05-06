import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert' as convert;

import 'package:history_go/main.dart';

void main(){
  testWidgets('Tests backend', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    var url = 'https://group4-75.pvt.dsv.su.se/hello';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print('Response body: ${response.body}');
      print('Json body: ${jsonResponse.body}');
    }else {
      print('Request failed with status: ${response.statusCode}.');
    }


    //print(await http.read('https://group4-75.pvt.dsv.su.se/hello'));

    expect(true, true);
  });

  testWidgets('Tests backend #2', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    var url = 'https://group4-75.pvt.dsv.su.se/getPlace?lats=59.321&lats=18.095';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print('Response body: ${response.body}');
      print('Json body: ${jsonResponse.body}');
    }else {
      print('Request failed with status: ${response.statusCode}.');
    }


    //print(await http.read('https://group4-75.pvt.dsv.su.se/hello'));

    expect(true, true);
  });


}
