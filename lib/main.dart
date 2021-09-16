import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/Search/pages/SearchPages.dart';
import 'package:web_media_monitoring/modules/dashboard/dashboardPage.dart';
import 'package:web_media_monitoring/modules/login/pages/LoginPages.dart';
import 'package:web_media_monitoring/modules/signup/pages/SignupPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/clientPage',
      routes: {
        '/loginPage': (context) => LoginScreen(),
        '/signupPage': (context) => SignupScreen(),
        '/clientPage': (context) => SearchScreen(),
        '/dashboardPage': (context) => DashboardPage()
      },
      title: 'Media Monitoring',
    );
  }
}
