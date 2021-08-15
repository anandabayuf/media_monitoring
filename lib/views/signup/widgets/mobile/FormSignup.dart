import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:web_media_monitoring/Controller/signupController.dart';
import 'package:web_media_monitoring/model/signupModel.dart';

class FormSignup extends StatefulWidget {
  @override
  FormSignupState createState() => FormSignupState();
}

class FormSignupState extends State<FormSignup> implements SignupViewModel {
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
    signupController = SignupController(this);
  }

  void _doSignup(String name, String email, String password, String deviceID) {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      if (name.length > 5) {
        if (password.length > 8) {
          signupController.signup(name, email, password, deviceID);
        } else {
          toast("Password at least eight letter");
        }
      } else {
        toast("Name at least five letter");
      }
    } else {
      toast("Please fill all forms");
    }
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
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 400,
              child: Text(
                "Nama",
                style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
              ),
            ),
            Container(
              width: 400,
              child: TextFormField(
                controller: _nama,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: 'Masukkan Nama Anda...',
                    fillColor: Colors.white,
                    filled: true),
                validator: (String? value) {
                  if (value == '') {
                    return 'Nama harus diisi';
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
                  if (value == null) {
                    return 'Email harus diisi';
                  } else if (value != null && !value.contains('@')) {
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
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: 'Masukkan Password Anda...',
                    fillColor: Colors.white,
                    filled: true),
                validator: (String? value) {
                  if (value == '') {
                    return 'Password Harus diisi';
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
                "Konfirmasi Password",
                style: TextStyle(fontSize: 15.0, color: HexColor("#F5EAEA")),
              ),
            ),
            Container(
              width: 400,
              child: TextFormField(
                controller: _konfirmasiPassword,
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: 'Masukkan Kembali Password Anda...',
                    fillColor: Colors.white,
                    filled: true),
                validator: (String? value) {
                  if (value != _password.text.trim()) {
                    return 'Password tidak sama';
                  }
                  return null;
                },
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
                    _doSignup(_nama.text.trim(), _email.text.trim(),
                        _konfirmasiPassword.text.trim(), deviceID);
                  }
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ]),
        ));
  }

  @override
  void finish() => Navigator.of(context).pushReplacementNamed('/loginPage');
  @override
  void toast(String message) => Fluttertoast.showToast(msg: message);
}
