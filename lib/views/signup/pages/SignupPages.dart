import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/signup/widgets/web/ContainerWidget.dart';
import 'package:web_media_monitoring/views/signup/widgets/mobile/ContainerWidget.dart';
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
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 800) {
                return ContainerWidgetWeb();
              } else {
                return ContainerWidgetMobile();
              }
            },
          ),
        )
    );
  }
}