import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/login/widgets/FormLogin.dart';

class leftSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Log in ${screenSize.width.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 32.0),
          ),
          SizedBox(height: screenSize.width < 1920 ? 60 : 100),
          Center(
            child: formLogin(),
          ),
          SizedBox(height: screenSize.width < 1920 ? 60 : 100),
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
          SizedBox(height: screenSize.width < 1920 ? 30 : 30*2),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              SizedBox(
                                width: 10,
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
                              SizedBox(
                                width: 10,
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
          SizedBox(height: screenSize.width < 1920 ? 60 : 100),
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