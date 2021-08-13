import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/signup/widgets/LeftSideWidget.dart';
import 'package:web_media_monitoring/modules/signup/widgets/RightSideWidget.dart';
import 'package:hexcolor/hexcolor.dart';

class containerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1536,
        height: 763,
        child: Card(
            color: HexColor("#2E2B2B"),
            margin: EdgeInsets.all(40.0),
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: leftSideWidget(),
                ),
                Expanded(
                  child: rightSideWidget(),
                )
              ],
            )
        ),
      )
    );
  }
}