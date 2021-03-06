import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/model/userModel.dart';

class LoginController {
  BuildContext context;
  LoginController(this.context);
  RestClient api = RestClient(Dio());
  String? deviceID = "";

  void login(String email, String password, String deviceID) async {
    await api.login(email, password, deviceID).then((response) async {
      int status = response.status;
      print(status);
      if (response.status == 1) {
        UserModel user = UserModel.fromJson(response.data);
        this.success(
            user.token, deviceID, user.role, user.id, user.name, user.email);
        finish(user.role);
      } else {
        Fluttertoast.showToast(msg: "Login Gagal, Silahkan ulangi");
      }
    }).catchError((e) {
      print("Exception $e");
      Fluttertoast.showToast(msg: "Terjadi Kesalahan");
    });
  }

  void success(String token, String deviceID, String role, int id, String name,
      String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
    await prefs.setString("deviceID", deviceID);
    await prefs.setString("role", role);
    await prefs.setInt("id", id);
    await prefs.setString("name", name);
    await prefs.setString("email", email);
  }

  void finish(String role) {
    if (role == 'admin') {
      Navigator.of(context).pushReplacementNamed('/adminPage');
    } else if (role == 'operator') {
      Navigator.of(context).pushReplacementNamed('/operatorPage');
    } else {
      Navigator.of(context).pushReplacementNamed('/search');
    }
  }
}
