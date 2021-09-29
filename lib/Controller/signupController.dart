import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';


class SignupController {
  BuildContext context;

  SignupController(this.context);
  RestClient api = RestClient(Dio());

  void success(String token, String deviceID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
    await prefs.setString("device_id", deviceID);
  }

  void signup(
      String name, String email, String password, String deviceID) async {
    print('nama: $name');
    print('email: $email');
    print('Password: $password');
    print('deviceID: $deviceID');
    await api.signup(name, email, password, deviceID).then((response) {
      if (response.status == 1) {
        Navigator.of(context).pushReplacementNamed("loginPage");
      } else {
        Fluttertoast.showToast(msg: "Signup Gagal, Silahkan ulangi");
      }
    }).catchError((e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Terjadi Kesalahan, silahkan coba lagi setelah beberapa saat");
    });
  }
}
