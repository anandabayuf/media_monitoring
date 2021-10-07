import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/client/akunsaya/pages/AkunSayaPages.dart';
import 'package:web_media_monitoring/views/client/listberita/pages/ListBeritaPages.dart';
import 'package:web_media_monitoring/views/client/listtweets/pages/ListTweetsPages.dart';
import 'package:web_media_monitoring/views/login/pages/LoginPages.dart';

import 'views/client/dashboard/pages/DashboardPages.dart';
import 'views/login/pages/LoginPages.dart';
import 'views/client/search/pages/SearchPages.dart';
import 'views/signup/pages/SignupPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Monitoring',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/search': (context) => SearchScreen(),
        '/myaccount': (context) => MyAccountScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/dashboard/listtweets': (context) => ListTweetsScreen(),
        '/dashboard/listberita': (context) => ListBeritaScreen(),
      },
    );
  }
}
