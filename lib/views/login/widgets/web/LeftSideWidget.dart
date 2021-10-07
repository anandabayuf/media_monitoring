import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_media_monitoring/views/login/widgets/FormLogin.dart';
import 'package:hexcolor/hexcolor.dart';

class LeftSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Log in',
              style: TextStyle(
                  fontSize: 32.0,
                  color: HexColor("#F5EAEA")
              )
            ),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: FormLogin(),
            ),
          ),
          Expanded(
            child: Center(
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
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 210,
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
                          // Icon(
                          //   Icons.facebook,
                          //   color: Colors.black,
                          //   size: 32.0,
                          // ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Log in dengan Google",
                            style:
                              TextStyle(
                                fontSize: 15,
                                color: Colors.white
                              ),
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      decoration: TextDecoration.underline, fontSize: 15),
                ),
                onPressed: () {},
                child: const Text('Lupa Password ?')
              ),
            ),
          ),
          SizedBox(height: screenSize.width < 1920 ? 15 : 15 * 2),
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
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
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
