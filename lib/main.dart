import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/login/pages/LoginPages.dart';
import 'package:web_media_monitoring/modules/signup/pages/SignupPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Comfortaa',
        ),
        home: LoginScreen()
    );
  }
}

