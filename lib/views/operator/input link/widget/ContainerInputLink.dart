import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/operator/input%20link/widget/DialogSuccesInputLink.dart';

class InputLink extends StatelessWidget {
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
                      "Input Data Berita \nMelalui Link",
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
                            Icons.link,
                            color: Colors.white,
                            size: 32.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          hintText: 'Masukkan Link Berita',
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
                    SizedBox(height: 60),
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
                                    DialogSuccessInputLink(context));
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
