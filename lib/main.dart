import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/homeScreen.dart';
import 'package:todo/home/tabs/settingTaB.dart';
import 'package:todo/splashScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    debugShowCheckedModeBanner: false,
    locale: Locale("en"),
    initialRoute: splashScreen.routename,
    routes: {
      splashScreen.routename: (context) => splashScreen(),
      homeScreen.routename: (context) => homeScreen(),
      settingsTab.routename:(context) => settingsTab(),
    },
  ));
}
