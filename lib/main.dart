import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/Search/pages/SearchPages.dart';
import 'package:web_media_monitoring/modules/login/pages/LoginPages.dart';
import 'package:web_media_monitoring/modules/signup/pages/SignupPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loginPage',
      routes: {
        '/loginPage': (context) => LoginScreen(),
        '/signupPage': (context) => SignupScreen(),
        '/clientPage': (context) => SearchScreen()
      },
      title: 'Media Monitoring',
    );
  }
}
