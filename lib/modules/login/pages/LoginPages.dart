import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/login/widgets/FormLogin.dart';
import 'package:web_media_monitoring/modules/login/widgets/ContainerWidget.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: containerWidget()
    );
  }
}