import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
        body: Center(
          child: Container(
            color: HexColor("#101010"),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Cari Berita atau Tweets",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: screenSize.width < 1920 ? 30 : 5 * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: screenSize.width < 1920 ? 30 : 5 * 2),
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
                          }
                        },
                        child: const Text(
                          'Cari',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    )
                  ]
              ),
            )
          ),
        ));
  }
}
