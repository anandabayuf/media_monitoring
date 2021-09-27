import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/akunsaya/pages/AkunSayaPages.dart';

import 'views/dashboard/dashboardPage.dart';
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
      initialRoute: '/akunsaya',
      routes: {
        '/loginPage': (context) => LoginScreen(),
        '/signupPage': (context) => SignupScreen(),
        '/search': (context) => SearchScreen(),
        '/dashboardPage': (context) => DashboardPage(),
        '/akunsaya': (context) => AkunSayaScreen()
      },
      title: 'Media Monitoring',
    );
  }
}
