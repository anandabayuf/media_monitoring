import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/views/client/AppBarClient.dart';
import 'package:web_media_monitoring/views/client/DrawerClient.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/ContainerProfile.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/ContainerDeleteAcc.dart';

class MyAccountScreen extends StatelessWidget {
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
                                            AlertDialog(
                                              backgroundColor: Colors.white.withOpacity(0.70),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(32.0)),
                                              ),
                                              title: Column(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        "https://picsum.photos/200"),
                                                    radius: 100,
                                                  ),
                                                  SizedBox(height: 10),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        elevation: 10.0,
                                                        primary: Colors.blue),
                                                    onPressed: () => Navigator.pop(
                                                        context, 'Unggah Foto'),
                                                    child: const Text(
                                                      'Unggah Foto',
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        elevation: 10.0,
                                                        primary: Colors.red),
                                                    onPressed: () => Navigator.pop(
                                                        context, 'Hapus Foto'),
                                                    child: const Text(
                                                      'Hapus Foto',
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        elevation: 10.0,
                                                        primary: HexColor(
                                                            "#76767A"
                                                        )
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Batal'
                                                        ),
                                                    child: const Text(
                                                      'Batal',
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  ElevatedButton(
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                            elevation: 10.0,
                                                            primary:
                                                                Colors.green),
                                                    onPressed: () async {
                                                      String token = "";
                                                      String deviceId = "";
                                                      int id = -1;
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      token = prefs.getString(
                                                          "api_token")!;
                                                      deviceId = prefs
                                                          .getString("DeviceID")!;
                                                      id = prefs.getInt("id")!;
                                                      //API integration

                                                      Navigator.pop(
                                                          context, 'Simpan');
                                                    },
                                                    child: const Text(
                                                      'Simpan',
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ContainerProfile(),
                    SizedBox(height: 30),
                    ContainerDeleteAcc()
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
