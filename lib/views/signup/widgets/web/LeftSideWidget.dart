import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/signup/widgets/FormSignup.dart';
import 'package:hexcolor/hexcolor.dart';

class LeftSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text('Sign up',
                style: TextStyle(fontSize: 32.0, color: HexColor("#F5EAEA"))),
          ),
          Expanded(
            flex: 12,
            child: Center(
              child: FormSignup(),
            ),
          ),
          SizedBox(height: 60),
          Flexible(
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah punya akun ?",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          decoration: TextDecoration.underline, fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text('Log in')),
              ],
            )),
          )
        ],
      ),
    );
  }
}
