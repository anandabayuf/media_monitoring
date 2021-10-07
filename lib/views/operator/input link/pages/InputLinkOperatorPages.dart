import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/operator/AppBarOperator.dart';
import 'package:web_media_monitoring/views/operator/DrawerOperator.dart';
import 'package:web_media_monitoring/views/operator/input%20link/widget/ContainerInputLink.dart';

class OperatorScreenInputLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarOperator(context),
      drawer: DrawerOperator(context),
      body: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: HexColor("#101010"),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                width: 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputLink(),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
