import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FormLogin extends StatefulWidget {
  @override
  FormLoginState createState() => FormLoginState();
}

class FormLoginState extends State<FormLogin> {
  late TextEditingController _email;
  late TextEditingController _password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SizedBox(height: screenSize.width < 1920 ? 5 : 5*2),
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
                  if (value != null && !value.contains('@')) {
                    return 'Masukkan alamat email yang valid';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 10 : 10*2),
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
            SizedBox(height: screenSize.width < 1920 ? 5 : 5*2),
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
                  'Log in',
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