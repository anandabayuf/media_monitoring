import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/controller/authentication.dart';
import 'package:web_media_monitoring/controller/searchController.dart';

void _logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchController searchController;
  late String keyword;
  late String deviceID;
  late String token;
  late Authentication authentication;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Media Monitoring"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          content: Text("Are you sure want to logout?"),
                          actions: <Widget>[
                            TextButton(
                              child: Text("SIGN OUT"),
                              onPressed: () {
                                _logout();
                                Navigator.of(context)
                                    .pushReplacementNamed('/loginPage');
                              },
                            ),
                          ]);
                    });
              },
            )
          ],
        ),
        body: Center(
          child: Container(
              height: 450,
              width: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Cari berita",
                    style: TextStyle(fontSize: 30),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "masukan kata kunci",
                            ),
                          )),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () async {
                          token = await authentication.getToken();
                          deviceID = await authentication.getDeviceID();
                          searchController.search(keyword, token, deviceID);
                        },
                        child: Icon(Icons.search),
                      ))
                    ],
                  ),
                ],
              )),
        ));
  }
}
