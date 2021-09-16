import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/login/widgets/web/LeftSideWidget.dart';
import 'package:web_media_monitoring/views/login/widgets/web/RightSideWidget.dart';
import 'package:hexcolor/hexcolor.dart';





class ContainerProfileWeb extends StatelessWidget {
  String username = "John Doe";
  String email = "johndoe@gmail.com";
  String password = "•••••••••••••••";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: 600,
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#707070")),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Nama",
                style: TextStyle(
                  color: HexColor("#999999"),
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                this.username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                  elevation: 10,
                  primary: HexColor("#76767A"),
                ),
                onPressed: () async {
                },
                child: const Text(
                  'Ubah',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
          Text(
            "Email",
            style: TextStyle(
              color: HexColor("#999999"),
              fontSize: 15.0,
            ),
          ),Text(
            "Password",
            style: TextStyle(
              color: HexColor("#999999"),
              fontSize: 15.0,
            ),
          )
        ],
      ),
    );
  }
}
