import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/login/widgets/web/ContainerWidget.dart';
import 'package:web_media_monitoring/views/login/widgets/mobile/ContainerWidget.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ColorfulSafeArea(
          color: HexColor("#616161"),
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
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

            child: SingleChildScrollView(
              child: Container(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth > 800) {
                      return ContainerWidgetWeb();
                    } else {
                      return ContainerWidgetMobile();
                    }
                  },
                ),
      ),
            ),
          ),
        )
    );
  }
}