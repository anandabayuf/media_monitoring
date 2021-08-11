import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: containerWidget()
    );
  }
}

class containerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(40.0),
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: leftSideWidget(),
            ),
            Expanded(
              child: rightSideWidget(),
            )
          ],
        )
      ),
    );
  }
}

class leftSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Log in',
            style: TextStyle(fontSize: 32.0),
          ),
          SizedBox(height: 60),
          Center(
            child: formLogin(),
          ),
          SizedBox(height: 60),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Text("atau"),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5.0),
                    child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Colors.black,
                                size: 32.0,
                              ),
                              Text(
                                "Log in dengan Google",
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5.0),
                    child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Colors.black,
                                size: 32.0,
                              ),
                              Text(
                                "Log in dengan Facebook",
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  )
                ],
              )
          ),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya Akun ?",
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Sign Up')
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}

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
            SizedBox(height: 5),
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
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              width: 400,
              child: Text(
                "Password",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(height: 5),
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
            SizedBox(height: 15),
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
            SizedBox(height: 15),
            Container(
              width: 400,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 15
                    ),
                    elevation: 10
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  }
                },
                child: const Text('Log in'),
              ),
            ),
          ]
      ),
    );
  }
}

class rightSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Image.asset('assets/images/logo_Polban.png'),
    );
  }
}