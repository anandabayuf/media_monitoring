import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:web_media_monitoring/Controller/signupController.dart';

import 'package:crypto/crypto.dart';

class FormSignup extends StatefulWidget {
  @override
  FormSignupState createState() => FormSignupState();
}

class FormSignupState extends State<FormSignup> {
  late SignupController signupController;
  late TextEditingController _nama;
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _konfirmasiPassword;
  final _formKey = GlobalKey<FormState>();
  late String deviceID;

  @override
  void initState() {
    super.initState();
    _nama = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _konfirmasiPassword = TextEditingController();
    signupController = SignupController(context);
  }

  @override
  void dispose() {
    _nama.dispose();
    _email.dispose();
    _password.dispose();
    _konfirmasiPassword.dispose();

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
            "Nama",
            style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 5 : 5),
        Container(
          width: 400,
          child: TextFormField(
            controller: _nama,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Masukkan Nama Anda...',
                fillColor: Colors.white,
                filled: true),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'Nama harus diisi';
              }
              return null;
            },
            onChanged: (String value){
              if (_formKey.currentState!.validate()) {}
            },
            onFieldSubmitted: (String value){

            },
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 10 : 10),
        Container(
          alignment: Alignment.centerLeft,
          width: 400,
          child: Text(
            "Email",
            style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 5 : 5),
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
              if (value == '' || value!.trim() == '') {
                return 'Email harus diisi';
              } else if (!value.contains('@')) {
                return 'Masukkan alamat email yang valid';
              }
              return null;
            },
            onChanged: (String value) {
              if (_formKey.currentState!.validate()) {}
            },
            onFieldSubmitted: (String value){

            },
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 10 : 10),
        Container(
          alignment: Alignment.centerLeft,
          width: 400,
          child: Text(
            "Password",
            style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 5 : 5),
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
                filled: true),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'Password harus diisi';
              } else if (value.contains(' ')) {
                return 'Password tidak boleh mengandung spasi';
              } else if(value.length < 8) {
                return 'Password harus terdiri setidaknya 8 karakter';
              }
              return null;
            },
            onChanged: (String value) {
              if (_formKey.currentState!.validate()) {}
            },
            onFieldSubmitted: (String value){

            },
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 10 : 10),
        Container(
          alignment: Alignment.centerLeft,
          width: 400,
          child: Text(
            "Konfirmasi Password",
            style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
          ),
        ),
        SizedBox(height: screenSize.width < 1920 ? 5 : 5),
        Container(
          width: 400,
          child: TextFormField(
            controller: _konfirmasiPassword,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Masukkan Kembali Password Anda...',
                fillColor: Colors.white,
                filled: true),
            validator: (String? value) {
              if (value != _password.text) {
                return 'Password tidak sama';
              }
              return null;
            },
            onChanged: (String value) {
              if (_formKey.currentState!.validate()) {}
            },
            onFieldSubmitted: (String value) async {
              late String _konfirmasiPasswordEncode =
              md5.convert(utf8.encode(_password.text.trim())).toString();
              deviceID = (await PlatformDeviceId.getDeviceId)!;
              if (deviceID.contains("Mozilla")) {
                String now = DateTime.now().toString();
                String hash = md5.convert(utf8.encode(now)).toString();
                deviceID = _email.text.trim() + "$hash";
              } else {
                deviceID = (await PlatformDeviceId.getDeviceId)!;
              }
              if (_formKey.currentState!.validate()) {
                signupController.signup(_nama.text.trim(), _email.text.trim(),
                    _konfirmasiPasswordEncode, deviceID);
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
              late String _konfirmasiPasswordEncode =
                  md5.convert(utf8.encode(_password.text.trim())).toString();
              deviceID = (await PlatformDeviceId.getDeviceId)!;
              if (deviceID.contains("Mozilla")) {
                String now = DateTime.now().toString();
                String hash = md5.convert(utf8.encode(now)).toString();
                deviceID = _email.text.trim() + "$hash";
              } else {
                deviceID = (await PlatformDeviceId.getDeviceId)!;
              }
              if (_formKey.currentState!.validate()) {
                signupController.signup(_nama.text.trim(), _email.text.trim(),
                    _konfirmasiPasswordEncode, deviceID);
              }
            },
            child: const Text(
              'Sign up',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  @override
  void finish() => Navigator.of(context).pushReplacementNamed('/login');

  @override
  void toast(String message) => Fluttertoast.showToast(msg: message);
}
