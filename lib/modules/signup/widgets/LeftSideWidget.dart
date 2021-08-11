import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/signup/widgets/FormSignup.dart';

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
            'Sign up',
            style: TextStyle(fontSize: 32.0),
          ),
          SizedBox(height: screenSize.width < 1920 ? 60 : 100),
          Center(
            child: FormSignup(),
          ),
          SizedBox(height: screenSize.width < 1920 ? 60 : 100),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun ?",
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
                      child: const Text('Log in')
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}