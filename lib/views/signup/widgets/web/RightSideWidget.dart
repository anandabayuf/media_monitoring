import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class rightSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: SvgPicture.asset('assets/images/signup/signup_web.svg'),
    );
  }
}