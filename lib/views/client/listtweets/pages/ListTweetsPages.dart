import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:web_media_monitoring/views/client/AppBarClient.dart';
import 'package:web_media_monitoring/views/client/DrawerClient.dart';
import 'package:web_media_monitoring/views/client/listtweets/widgets/ContainerListTweets.dart';
import 'package:web_media_monitoring/views/client/listtweets/widgets/ContainerTitle.dart';

class ListTweetsScreen extends StatefulWidget {
  @override
  _ListTweetsScreenState createState() => _ListTweetsScreenState();
}

class _ListTweetsScreenState extends State<ListTweetsScreen> {
  String keyword = "Manchester United";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBarClient(context),
        drawer: DrawerClient(context),
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: HexColor("#101010"),
          child: SingleChildScrollView(
            child: Container(
                width: screenSize.width,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ContainerTitle(this.keyword),
                    SizedBox(height: 10.0,),
                    ContainerListTweets(this.keyword)
                  ],
                )
            ),
          ),
        )
    );
  }
}

