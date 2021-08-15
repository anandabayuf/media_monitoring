import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FormSignup extends StatefulWidget {
  @override
  FormSignupState createState() => FormSignupState();
}

class FormSignupState extends State<FormSignup> {
  late TextEditingController _nama;
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _konfirmasi_password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nama = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _konfirmasi_password = TextEditingController();
  }

  @override
  void dispose() {
    _nama.dispose();
    _email.dispose();
    _password.dispose();
    _konfirmasi_password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 400,
              child: Text(
                "Nama",
                style: TextStyle(
                    fontSize: 15.0,
                    color: HexColor("#F5EAEA")
                ),
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
                    filled: true
                ),
                validator: (String? value) {
                  if (value == '') {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 10 : 10),
            Container(
              alignment: Alignment.centerLeft,
              width: 400,
              child: Text(
                "Email",
                style: TextStyle(
                    fontSize: 15.0,
                    color: HexColor("#F5EAEA")
                ),
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
                    filled: true
                ),
                validator: (String? value) {
                  if(value == null) {
                    return 'Email harus diisi';
                  } else if (value != null && !value.contains('@')) {
                    return 'Masukkan alamat email yang valid';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 10 : 10),
            Container(
              alignment: Alignment.centerLeft,
              width: 400,
              child: Text(
                "Password",
                style: TextStyle(
                    fontSize: 15.0,
                    color: HexColor("#F5EAEA")
                ),
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
                  filled: true
                ),
                validator: (String? value) {
                  if (value == '') {
                    return 'Password Harus diisi';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 10 : 10),
            Container(
              alignment: Alignment.centerLeft,
              width: 400,
              child: Text(
                "Konfirmasi Password",
                style: TextStyle(
                    fontSize: 15.0,
                    color: HexColor("#F5EAEA")
                ),
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 5 : 5),
            Container(
              width: 400,
              child: TextFormField(
                controller: _konfirmasi_password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Masukkan Kembali Password Anda...',
                  fillColor: Colors.white,
                  filled: true
                ),
                validator: (String? value) {
                  if(value != _password.text) {
                    return 'Password tidak sama';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 30 : 30),
            Container(
              width: 400,
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 15
                  ),
                  elevation: 10,
                  primary: HexColor("#76767A"),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  }
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}