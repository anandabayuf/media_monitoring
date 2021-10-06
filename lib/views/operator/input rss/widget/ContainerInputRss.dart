import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InputRss extends StatelessWidget {
  late TextEditingController _keyword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Container(
            width: screenSize.width,
            color: HexColor("#101010"),
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Input Data Berita \nMelalui RSS",
                      style: TextStyle(fontSize: 32, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 90),
                    Container(
                      width: 600,
                      child: TextFormField(
                        controller: _keyword,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.rss_feed,
                            color: Colors.white,
                            size: 32.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          hintText: 'Masukkan RSS',
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
                          }
                        },
                        child: const Text(
                          'Selesai',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    )
                  ]),
            )),
      ),
    );
  }
}
