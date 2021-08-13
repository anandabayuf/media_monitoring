import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SvgPicture.asset('assets/images/login/login_mobile.svg'),
    );
  }
}
