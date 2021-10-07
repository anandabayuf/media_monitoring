import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerClient extends Drawer{
  DrawerClient(BuildContext context):super(
    child: ColorfulSafeArea(
      color: HexColor("#101010"),
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
                  SizedBox(height: 10.0),
                  Text(
                    "John Doe",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
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
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                onTap: () {
                  if(ModalRoute.of(context)!.settings.name != "/search"){
                    Navigator.of(context).pushReplacementNamed('/search');
                  } else {
                    Navigator.pop(context);
                  }
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
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                onTap: () {
                  if(ModalRoute.of(context)!.settings.name != "/myaccount"){
                    Navigator.of(context).pushReplacementNamed('/myaccount');
                  } else {
                    Navigator.pop(context);
                  }
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
                      style: TextStyle(fontSize: 15.0, color: Colors.red),
                    ),
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.clear();
                      // Then close the drawer
                      Navigator.pop(context);
                      Navigator.of(context).pushReplacementNamed("/login");
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )
  );
}