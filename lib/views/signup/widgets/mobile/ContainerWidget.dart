import 'package:flutter/material.dart';
import 'package:web_media_monitoring/views/signup/widgets/mobile/TopSideWidget.dart';
import 'package:web_media_monitoring/views/signup/widgets/mobile/BottomSideWidget.dart';

class ContainerWidgetMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            TopSideWidget(),
            BottomSideWidget()
          ],
        )
    );
  }
}