import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/baseClass.dart';
import 'package:todo/login/loginn/login_connector.dart';

class loginViewModel extends BaseViewModel<LoginConnector>{

   login(String Email, String Password) async {
    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      connector!.hideLoading();
      connector!.goToHome();
    } on FirebaseAuthException catch (e) {
      connector!.hideLoading();
      connector!.showMessage(e.code);
    }
  }
}