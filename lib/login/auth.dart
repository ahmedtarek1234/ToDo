import 'package:flutter/material.dart';
import 'package:todo/login/loginn/loginTab.dart';
import 'package:todo/login/registerTab.dart';

class authScreen extends StatelessWidget {
  static const String routename = "authScreen";

  const authScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("Login")),
              Tab(icon: Text("Register")),
            ],
          ),
          title: Text('Auth Screen'),
        ),
        body: TabBarView(
          children: [loginTab(), registerTab()],
        ),
      ),
    );
  }
}
