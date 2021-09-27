import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/akunsaya/widgets/web/ContainerProfile.dart';
import 'package:web_media_monitoring/views/akunsaya/widgets/web/ContainerDeleteAcc.dart';

class AkunSayaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("assets/images/logo_media_monitoring.png"),
          ),
          title: Text(
            "Media Monitoring",
            style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w100,
                color: Colors.white
            ),
          ),
        ),
        bottom: PreferredSize(
            child: Container(
              color: HexColor("#707070"),
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)
        ),
        backgroundColor: HexColor("#101010"),
        toolbarHeight: 80.0,
      ),
      drawer: Drawer(
          child: Container(
            color: HexColor("#101010"),
            child: Column(
              children: [
                Card(
                  color: HexColor("#101010"),
                  elevation: 10.0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage("https://picsum.photos/200"),
                        radius: 50,
                      ),
                      SizedBox(height: screenSize.width < 1920 ? 10 : 5 * 2),
                      Text(
                        "John Doe",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: HexColor("#101010"),
                  elevation: 10.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Cari Berita atau Tweets',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      Navigator.of(context).pushReplacementNamed('/search');
                      // Then close the drawer
                      //Navigator.pop(context);
                    },
                  ),
                ),
                Card(
                  color: HexColor("#101010"),
                  elevation: 10.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Akun Saya',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      //Navigator.of(context).pushReplacementNamed('/akunsaya');
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      color: HexColor("#101010"),
                      elevation: 10.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: Text(
                          'Keluar',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.red
                          ),
                        ),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: HexColor("#101010"),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Akun Saya",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 170,
                      height: 150,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage("https://picsum.photos/200"),
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
                                    builder: (BuildContext context) => AlertDialog(
                                      backgroundColor: Colors.white.withOpacity(0.70),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                      ),
                                      title: CircleAvatar(
                                        backgroundImage: NetworkImage("https://picsum.photos/200"),
                                        radius: 100,
                                      ),
                                      content: Column(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 10.0,
                                                primary: HexColor("#707070")
                                            ),
                                            onPressed: () => Navigator.pop(context, 'Unggah Foto'),
                                            child: const Text(
                                              'Unggah Foto',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 10.0,
                                                primary: HexColor("#707070")
                                            ),
                                            onPressed: () => Navigator.pop(context, 'Hapus Foto'),
                                            child: const Text(
                                              'Hapus Foto',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white
                                              ),
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
                                                  primary: HexColor("#707070")
                                              ),
                                              onPressed: () => Navigator.pop(context, 'Batal'),
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
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 10.0,
                                                  primary: HexColor("#707070")
                                              ),
                                              onPressed: () => Navigator.pop(context, 'Simpan'),
                                              child: const Text(
                                                'Simpan',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }
                              ),
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
        )
      ),
    );
  }
}