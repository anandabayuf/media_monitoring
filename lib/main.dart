import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/views/client/akunsaya/pages/AkunSayaPages.dart';
import 'package:web_media_monitoring/views/client/listberita/pages/ListBeritaPages.dart';
import 'package:web_media_monitoring/views/client/listtweets/pages/ListTweetsPages.dart';
import 'package:web_media_monitoring/views/login/pages/LoginPages.dart';
import 'package:web_media_monitoring/views/operator/input%20link/pages/InputLinkOperatorPages.dart';
import 'package:web_media_monitoring/views/operator/input%20manual/pages/InputManualOperatorPages.dart';
import 'package:web_media_monitoring/views/operator/input%20rss/pages/InputRssOperatorPages.dart';

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
        '/berita/inputlink': (context) => OperatorScreenInputLink(),
        '/berita/inputrss': (context) => OperatorScreenInputRss(),
        '/berita/inputmanual': (context) => OperatorScreenInputManual(),
      },
    );
  }
}

class BaseRoute extends StatefulWidget {
  const BaseRoute({Key? key}) : super(key: key);

  @override
  _BaseRouteState createState() => _BaseRouteState();
}

class _BaseRouteState extends State<BaseRoute> {
  @override
  void initState() {
    super.initState();
    navigateToLastPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void navigateToLastPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // RestClient api = RestClient(Dio());
    // String token = prefs.getString("api_key") ?? "undifined";
    // String deviceID = prefs.getString("deviceID") ?? "undifined";
    // await api.auth(token, deviceID).then((response) {
    //   int status = response.status;
    //   if (status == 1) {
    //     String lastRoute = prefs.getString('lastRoute') ?? ("/login");
    //     Navigator.of(context).pushNamed(lastRoute);
    //   } else {
    //     Navigator.of(context).pushReplacementNamed("/login");
    //   }
    // });
    String lastRoute = prefs.getString('lastRoute') ?? ("/login");
    Navigator.of(context).pushNamed(lastRoute);

    // No need to push to another screen, if the last route was root
  }
}
