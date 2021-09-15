import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("assets/images/logo_media_monitoring.png"),
          ),
        ),
        title: Text(
          "Media Monitoring",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w100
          ),
        ),
        actions: [

        ],
        backgroundColor: HexColor("#101010"),
        toolbarHeight: 80.0,
      ),
    );
  }
}
