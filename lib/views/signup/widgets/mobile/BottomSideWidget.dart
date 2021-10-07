import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/signup/widgets/FormSignup.dart';

class BottomSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sign up',
              style: TextStyle(fontSize: 32.0, color: HexColor("#F5EAEA"))
          ),
          SizedBox(height: 10.0,),
          Center(
            child: FormSignup(),
          ),
          Center(
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
        ],
      ),
    );
  }
}
