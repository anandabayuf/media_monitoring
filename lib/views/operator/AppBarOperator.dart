import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/Home.dart';

class AppBarOperator extends AppBar {
  AppBarOperator(BuildContext context)
      : super(
          title: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage("assets/images/logo_media_monitoring.png"),
            ),
            title: Text(
              "Media Monitoring",
              style: MediaQuery.of(context).size.width > 320
                  ? TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w100,
                      color: Colors.white)
                  : TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
            ),
          ),
          bottom: PreferredSize(
              child: Container(
                color: HexColor("#707070"),
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          backgroundColor: HexColor("#101010"),
          toolbarHeight: 80.0,
        );
}
