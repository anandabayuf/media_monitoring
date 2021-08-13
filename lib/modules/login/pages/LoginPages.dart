import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/login/widgets/ContainerWidget.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HexColor("#616161"),
              Colors.black
            ]
          )
        ),
        child: containerWidget(),
      )
    );
  }
}