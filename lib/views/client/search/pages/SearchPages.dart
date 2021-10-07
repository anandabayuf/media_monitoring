import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/client/AppBarClient.dart';
import 'package:web_media_monitoring/views/client/DrawerClient.dart';
import 'package:web_media_monitoring/views/client/dashboard/pages/DashboardPages.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    bool mobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: AppBarClient(context),
      drawer: DrawerClient(context),
      body: Center(
        child: Container(
          width: screenSize.width,
          color: HexColor("#101010"),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //text title
                Text(
                  "Cari Berita atau Tweets",
                  style: TextStyle(fontSize: mobile ? 24 : 32, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                //container form search field
                Container(
                  width: 600,
                  padding: mobile ?
                    EdgeInsets.all(10.0) :
                      EdgeInsets.zero,
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
                      hintText: 'masukkan kata kunci',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (String? value) {
                      if (value == '' || value == ' ' || value!.trim() == '') {
                        return 'kata kunci harus diisi';
                      }
                      return null;
                    },
                    onChanged: (String value) {
                      if (_formKey.currentState!.validate()) {}
                    },
                    onFieldSubmitted: (String value) {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed(
                          "/dashboard",
                          arguments: this._keyword.text.trim()
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
                        Navigator.of(context).pushNamed(
                            "/dashboard",
                            arguments: this._keyword.text.trim()
                        );
                        this._keyword.clear();
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
      )
    );
  }
}
