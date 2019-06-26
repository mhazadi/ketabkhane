import 'package:flutter/material.dart';
import 'package:book_app/Home.dart';
import 'package:book_app/Login.dart';
import 'package:book_app/Register.dart';
import 'package:book_app/profile.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Register(),
    routes: <String, WidgetBuilder>{
      '/Register': (BuildContext context) => new Register(),
      '/Login': (BuildContext context) => new Login(),
      '/Home': (BuildContext context) => new Home(),
      '/Profile': (BuildContext context) => new Profile(),
    },
  ));
}
