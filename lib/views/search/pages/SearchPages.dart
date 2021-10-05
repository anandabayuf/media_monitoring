import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/akunsaya/pages/AkunSayaPages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/views/dashboard/dashboardPage.dart';
import 'package:web_media_monitoring/views/dashboard/pages/DashboardPages.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:web_media_monitoring/controller/authentication.dart';
// import 'package:web_media_monitoring/controller/searchController.dart';
//
// void _logout() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.clear();
// }

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // late SearchController searchController;
  // late String keyword;
  // late String deviceID;
  // late String token;
  // late Authentication authentication;
  late TextEditingController _keyword;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _keyword = TextEditingController();
  }

  @override
  void dispose() {
    _keyword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage("assets/images/logo_media_monitoring.png"),
            ),
            title: Text(
              "Media Monitoring",
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
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
                      backgroundImage:
                          NetworkImage("https://picsum.photos/200"),
                      radius: 50,
                    ),
                    SizedBox(height: screenSize.width < 1920 ? 10 : 5 * 2),
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
                    // Update the state of the app
                    //Navigator.of(context).pushReplacementNamed('/search');
                    // Then close the drawer
                    Navigator.pop(context);
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
                    // Update the state of the app
                    Navigator.of(context).pushReplacementNamed('/myaccount');
                    // Then close the drawer
                    //Navigator.pop(context);
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
        )),
        body: Center(
          child: Container(
              width: screenSize.width,
              color: HexColor("#101010"),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cari Berita atau Tweets",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: 600,
                        child: TextFormField(
                          controller: _keyword,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: 'Masukkan kata kunci',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (String? value) {
                            if (value == '' || value == ' ') {
                              return 'Keyword tidak sesuai';
                            }
                            return null;
                          },
                          onFieldSubmitted: (String value) {
                            if (_formKey.currentState!.validate()) {
                              //buat test masuk atau engga
                              print("Cari " + value);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      DashboardScreen()
                                  ),
                              );
                              this._keyword.clear();
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: 200,
                        height: 35,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                            elevation: 10,
                            primary: HexColor("#76767A"),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //buat test masuk atau engga
                              print("Cari " + this._keyword.text);
                              // Navigator.pushNamed(
                              //   context,
                              //   // MaterialPageRoute(
                              //   //   builder: (context) =>
                              //   //     DashboardPage(this._keyword.text)
                              //   // ),
                              //   DashboardScreen.routeName,
                              //   arguments: this._keyword.text
                              // );
                            }
                          },
                          child: const Text(
                            'Cari',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      )
                    ]),
              )),
        ));
  }
}
