import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/operator/input%20rss/widget/DialogSuccesInputRss.dart';

class InputRss extends StatefulWidget {
  @override
  _InputRssState createState() => _InputRssState();
}

class _InputRssState extends State<InputRss> {
  late TextEditingController _keyword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _valMedia;

  List _listMedia = [
    "detik",
    "liputan 6",
    "kumparan",
  ];

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
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "media harus diisi";
                            }
                            return null;
                          },
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          value: _valMedia,
                          items: _listMedia.map((value) {
                            return DropdownMenuItem(
                                child:
                                    Text(value, style: TextStyle(fontSize: 15)),
                                value: value);
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valMedia = value.toString();
                            });
                          },
                          hint: Text(
                            "pilih media",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(top: 20),
                    //   width: 600,
                    //   child: TextFormField(
                    //     controller: _keyword,
                    //     decoration: InputDecoration(
                    //       icon: Icon(
                    //         Icons.rss_feed,
                    //         color: Colors.white,
                    //         size: 32.0,
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(12.0),
                    //       ),
                    //       hintText: 'Masukkan RSS',
                    //       fillColor: Colors.white,
                    //       filled: true,
                    //     ),
                    //     validator: (String? value) {
                    //       if (value == '' || value == ' ') {
                    //         return 'Keyword tidak sesuai';
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
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
                            showDialog<String>(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) =>
                                    DialogSuccessInputRss(context));
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
