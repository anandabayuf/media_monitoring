import 'package:flutter/material.dart';

class formLogin extends StatefulWidget {
  @override
  formLoginState createState() => formLoginState();
}

class formLoginState extends State<formLogin> {
  late TextEditingController _email;
  late TextEditingController _password;
  bool isIngatSaya = false;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 10 : 10*2),
            Container(
              width: 400,
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Email Anda...'
                ),
                validator: (String? value) {
                  if (value != null && !value.contains('@')) {
                    return 'Masukkan alamat email yang valid';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 15 : 20*2),
            Container(
              alignment: Alignment.centerLeft,
              width: 400,
              child: Text(
                "Password",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 10 : 10*2),
            Container(
              width: 400,
              child: TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan Password Anda...',
                ),
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 15 : 15*2),
            Container(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isIngatSaya,
                        onChanged: (bool? value) {
                          setState(() {
                            isIngatSaya = value!;
                          });
                        },
                      ),
                      Text(
                        "Ingat Saya",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Lupa Password ?')
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.width < 1920 ? 15 : 15*2),
            Container(
              width: 400,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 15
                    ),
                    elevation: 10,
                    primary: Colors.white
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  }
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}