import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home/add_task_bottomSheet.dart';
import 'package:todo/home/homeScreen.dart';
import 'package:todo/home/tabs/settingTaB.dart';
import 'package:todo/login/auth.dart';
import 'package:todo/login/registerTab.dart';
import 'package:todo/myThemeData.dart';
import 'package:todo/providers/myProvider.dart';
import 'package:todo/splashScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) => MyProvider(),
    builder: (context, child) {
      var provider = Provider.of<MyProvider>(context);
      return MaterialApp(
        theme: myThemeData.lightTheme,
        darkTheme: myThemeData.darkTheme,
        themeMode: provider.themeMode,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: Locale(provider.languageCode),
        initialRoute: splashScreen.routename,
        routes: {
          splashScreen.routename: (context) => splashScreen(),
          homeScreen.routename: (context) => homeScreen(),
          settingsTab.routename: (context) => settingsTab(),
          authScreen.routename: (context) => authScreen(),
          bottomSheet.routename: (context) => bottomSheet(),
          registerTab.routename: (context) => registerTab(),
        },
      );
    },
  ));
}
