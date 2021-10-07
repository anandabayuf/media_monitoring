import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/client/AppBarClient.dart';
import 'package:web_media_monitoring/views/client/DrawerClient.dart';
import 'package:web_media_monitoring/views/client/listtweets/widgets/ContainerListTweets.dart';
import 'package:web_media_monitoring/views/client/listtweets/widgets/ContainerTitle.dart';

class ListTweetsScreen extends StatefulWidget {
  @override
  _ListTweetsScreenState createState() => _ListTweetsScreenState();
}

class _ListTweetsScreenState extends State<ListTweetsScreen> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String keyword = ModalRoute.of(context)!.settings.arguments as String;

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
                    ContainerTitle(keyword),
                    SizedBox(height: 10.0,),
                    ContainerListTweets(keyword)
                  ],
                )
            ),
          ),
        )
    );
  }
}

