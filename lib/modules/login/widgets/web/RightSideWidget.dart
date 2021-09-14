import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RightSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: SvgPicture.asset('assets/images/login/login_web.svg'),
    );
  }
}
