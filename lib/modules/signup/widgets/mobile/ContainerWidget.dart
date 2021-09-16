import 'package:flutter/material.dart';
import 'package:web_media_monitoring/modules/signup/widgets/mobile/TopSideWidget.dart';
import 'package:web_media_monitoring/modules/signup/widgets/mobile/BottomSideWidget.dart';

class ContainerWidgetMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: TopSideWidget(),
            ),
            Expanded(
              flex: 2,
              child: BottomSideWidget(),
            )
          ],
        )
    );
  }
}