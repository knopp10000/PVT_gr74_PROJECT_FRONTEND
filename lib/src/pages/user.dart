import 'package:flutter/material.dart';



class UserInfo{
  static String name;
  static String id;
  static String email;
  static String imgUrl;
  static Image img;
  UserInfo();

  @override
  String toString() {
    return "name: " + name;
  }


}