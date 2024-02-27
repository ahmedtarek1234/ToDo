import 'package:flutter/material.dart';

class myThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: Colors.white,
      
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Color(0XFF5D9CEC)),
        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0XFF5D9CEC),
        ),
        bodySmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0XFF5D9CEC),
        titleTextStyle: TextStyle(fontSize: 27),
      ),
      scaffoldBackgroundColor: Color(0XFFDFECDB),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
  static ThemeData darkTheme = ThemeData(
      primaryColor: Color(0XFF141922),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Color(0XFF5D9CEC)),
        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0XFF5D9CEC),
        ),
        bodySmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0XFF5D9CEC),
        titleTextStyle: TextStyle(fontSize: 27),
      ),
      scaffoldBackgroundColor: Colors.black38,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Color(0XFF141922),
        elevation: 0,
      ));
}
