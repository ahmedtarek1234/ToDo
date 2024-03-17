import 'package:flutter/material.dart';
import 'package:todo/home/homeScreen.dart';
import 'package:todo/login/auth.dart';

class splashScreen extends StatefulWidget {
  static const String routename = "splashScreen";

  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(authScreen.routename);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0XFFDFECDB),
        child: Center(
          child: Container(
            height: 189,
            width: 211,
            decoration: BoxDecoration(
              image: DecorationImage(

                image: AssetImage("assets/images/splash.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
