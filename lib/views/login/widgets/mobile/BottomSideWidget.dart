import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/login/widgets/FormLogin.dart';

class BottomSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Log in',
              style: TextStyle(fontSize: 32.0, color: HexColor("#F5EAEA"))
          ),
          SizedBox(height: 10.0,),
          Center(
            child: FormLogin(),
          ),
          SizedBox(height: 15),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: HexColor("#707070"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    "atau",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: HexColor("#707070"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Container(
              width: 250,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(5.0),
                child: Card(
                    elevation: 0,
                    color: HexColor("#2E2B2B"),
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Tab(
                            icon: Container(
                              child: SvgPicture.asset(
                                  "assets/icons/google-icon.svg"),
                              height: 32.0,
                              width: 32.0,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Log in dengan Google",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      decoration: TextDecoration.underline, fontSize: 15),
                ),
                onPressed: () {},
                child: const Text('Lupa Password ?')),
          ),
          SizedBox(height: 5),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Belum punya Akun ?",
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
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: const Text('Sign Up')),
            ],
          ))
        ],
      ),
    );
  }
}
