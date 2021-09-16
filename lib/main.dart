import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/akunsaya/pages/AkunSayaPages.dart';
import 'package:web_media_monitoring/views/login/pages/LoginPages.dart';
import 'package:web_media_monitoring/views/search/pages/SearchPages.dart';
import 'package:web_media_monitoring/views/signup/pages/SignupPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/search',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/akunsaya': (context) => AkunSayaScreen(),
        '/search': (context) => SearchScreen()
      },
      title: 'Media Monitoring',
    );
  }
}
