import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/Home.dart';

class AppBarOperator extends AppBar {
  AppBarOperator(BuildContext context)
      : super(
          title: Container(
            width: MediaQuery.of(context).size.width < 800 ? 280 : 350,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/logo_media_monitoring.png"),
              ),
              title: Text(
                "Media Monitoring",
                style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width < 800 ? 24.0 : 32.0,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
              ),
              onTap: () {
                if (ModalRoute.of(context)!.settings.name != "/news/inputrss") {
                  Navigator.of(context).pushReplacementNamed('/news/inputrss');
                }
              },
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
