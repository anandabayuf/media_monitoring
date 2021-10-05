import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/akunsaya/pages/AkunSayaPages.dart';
import 'package:web_media_monitoring/views/listberita/pages/ListBeritaPages.dart';
import 'package:web_media_monitoring/views/listtweets/pages/ListTweetsPages.dart';

import 'views/dashboard/pages/DashboardPages.dart';
import 'views/login/pages/LoginPages.dart';
import 'views/search/pages/SearchPages.dart';
import 'views/signup/pages/SignupPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/dashboard',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/search': (context) => SearchScreen(),
        '/myaccount': (context) => MyAccountScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/dashboard/listtweets': (context) => ListTweetsScreen(),
        '/dashboard/listberita': (context) => ListBeritaScreen(),
      },
      title: 'Media Monitoring',
    );
  }
}
