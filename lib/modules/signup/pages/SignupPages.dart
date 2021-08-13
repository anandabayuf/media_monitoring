import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/signup/widgets/ContainerWidget.dart';
import 'package:hexcolor/hexcolor.dart';

class SignupScreen extends StatelessWidget {
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