import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nanoid/nanoid.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Controller/loginController.dart';

import 'package:crypto/crypto.dart';

class FormLogin extends StatefulWidget {
  @override
  FormLoginState createState() => FormLoginState();
}

class FormLoginState extends State<FormLogin> {
  late LoginController presenter;
  late TextEditingController _email;
  late TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  late String deviceID = "";
  late String browserID;
  var id = nanoid();
  var customLengthId = nanoid(16);

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    presenter = LoginController(context);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 400,
          child: Text(
            "Email",
            style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 5 : 5 * 2),
        Container(
          width: 400,
          child: TextFormField(
            controller: _email,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Masukkan Email Anda...',
                fillColor: Colors.white,
                filled: true),
            validator: (String? value) {
              if(value == '' || value!.trim() == ''){
                return 'alamat email harus diisi';
              }else if (value != null && !value.contains('@')) {
                return 'Masukkan alamat email yang valid';
              }
              return null;
            },
            onChanged: (String value) {
              if (_formKey.currentState!.validate()) {}
            },
            onFieldSubmitted: (String value) async {
              if (deviceID.contains("Mozilla")) {
                String now = DateTime.now().toString();
                String hash = md5.convert(utf8.encode(now)).toString();
                deviceID = value.trim() + "$hash";
              } else {
                deviceID = (await PlatformDeviceId.getDeviceId)!;
              }
              if (_formKey.currentState!.validate()) {
                presenter.login(
                    value.trim(), _password.text.trim(), deviceID
                );
              }
            },
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 10 : 10 * 2),
        Container(
          alignment: Alignment.centerLeft,
          width: 400,
          child: Text(
            "Password",
            style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 5 : 5 * 2),
        Container(
          width: 400,
          child: TextFormField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Masukkan Password Anda...',
                fillColor: Colors.white,
                filled: true
            ),
            validator: (String? value) {
              if(value == '' || value!.trim() == ''){
                return 'password harus diisi';
              }
              return null;
            },
            onChanged: (String value) {
              if (_formKey.currentState!.validate()) {}
            },
            onFieldSubmitted: (String value) async {
              if (deviceID.contains("Mozilla")) {
                String now = DateTime.now().toString();
                String hash = md5.convert(utf8.encode(now)).toString();
                deviceID = _email.text.trim() + "$hash";
              } else {
                deviceID = (await PlatformDeviceId.getDeviceId)!;
              }
              if (_formKey.currentState!.validate()) {
                presenter.login(
                    _email.text.trim(), value.trim(), deviceID
                );
              }
            },
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 30 : 30),
        Container(
          width: 400,
          height: 35,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
              elevation: 10,
              primary: HexColor("#76767A"),
            ),
            onPressed: () async {
              if (deviceID.contains("Mozilla")) {
                String now = DateTime.now().toString();
                String hash = md5.convert(utf8.encode(now)).toString();
                deviceID = _email.text.trim() + "$hash";
              } else {
                deviceID = (await PlatformDeviceId.getDeviceId)!;
              }
              if (_formKey.currentState!.validate()) {
                presenter.login(
                    _email.text.trim(), _password.text.trim(), deviceID
                );
              }
            },
            child: const Text(
              'Log in',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }

  

  void toast(String message) => Fluttertoast.showToast(msg: message);
}
