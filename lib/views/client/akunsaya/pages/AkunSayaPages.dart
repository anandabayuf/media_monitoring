import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/client/AppBarClient.dart';
import 'package:web_media_monitoring/views/client/DrawerClient.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/ContainerProfile.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/ContainerDeleteAcc.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/DialogEditAvatar.dart';

class MyAccountScreen extends StatelessWidget {
  final String username = "John Doe";
  final String email = "johndoe@gmail.com";
  final String password = "••••••••";
  final String passwordOpen = "johndoe123";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool mobile = screenSize.width < 800;

    return Scaffold(
      appBar: AppBarClient(context),
      drawer: DrawerClient(context),
      body: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: HexColor("#101010"),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: mobile ? 10.0 : 0,
                  right: mobile ? 10.0 : 0
                ),
                width: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mobile ?
                      SizedBox.shrink() :
                      Text(
                        "Akun Saya",
                        style: TextStyle(fontSize: mobile ? 24.0 : 32.0, color: Colors.white),
                      ),
                    SizedBox(height: mobile ? 0: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 140,
                        height: 140,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage("https://picsum.photos/200"),
                                radius: 70,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HexColor("#76767A"),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.white,
                                  onPressed: () {
                                    showDialog<String>(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          DialogEditAvatar(context)
                                    );
                                  }
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: mobile ? 10.0 : 30),
                    ContainerProfile(this.username, this.email, this.password,
                    this.passwordOpen),
                    SizedBox(height: mobile ? 10.0 : 30),
                    ContainerDeleteAcc(this.email)
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
