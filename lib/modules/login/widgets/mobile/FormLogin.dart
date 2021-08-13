import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Controller/authentication.dart';
import 'package:web_media_monitoring/Controller/loginController.dart';
import 'package:web_media_monitoring/model/loginModel.dart';
import 'package:web_media_monitoring/model/userModel.dart';

class FormLogin extends StatefulWidget {
  @override
  FormLoginState createState() => FormLoginState();
}

class FormLoginState extends State<FormLogin> implements LoginViewModel {
  late LoginController presenter;
  late TextEditingController _email;
  late TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  late Authentication authentication = new Authentication();
  late String deviceID;
  UserModel user = new UserModel();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    presenter = LoginController(this);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void doLogin(String email, String password, String deviceID) {
    if (password.length < 8) {
      toast("Password berisi setidaknya 8 karakter");
      return;
    }
    presenter.login(email, password, deviceID);
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
        Container(
          width: 400,
          child: TextFormField(
            controller: _email,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Masukkan Email Anda...',
                fillColor: Colors.white,
                filled: true),
            validator: (String? value) {
              if (value != null && !value.contains('@')) {
                return 'Masukkan alamat email yang valid';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          width: 400,
          child: Text(
            "Password",
            style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
          ),
        ),
        Container(
          width: 400,
          child: TextFormField(
            controller: _password,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Masukkan Password Anda...',
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        SizedBox(height: 30),
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
              deviceID = (await PlatformDeviceId.getDeviceId)!;
              if (_formKey.currentState!.validate()) {
                doLogin(_email.text.trim(), _password.text.trim(), deviceID);
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

  @override
  Future<void> finish() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString('role');
    if (role == 'admin') {
      Navigator.of(context).pushReplacementNamed('/adminPage');
    } else if (role == 'operator') {
      Navigator.of(context).pushReplacementNamed('/operatorPage');
    } else {
      Navigator.of(context).pushReplacementNamed('/clientPage');
    }
  }

  @override
  void toast(String message) => Toast.values;
}
