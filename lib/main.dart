import 'package:flutter/material.dart';


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
