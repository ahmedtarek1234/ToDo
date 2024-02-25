import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/homeScreen.dart';
import 'package:todo/splashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: splashScreen.routename,
    routes: {
      splashScreen.routename: (context) => splashScreen(),
      homeScreen.routename: (context) => homeScreen(),
    },
  ));
}
