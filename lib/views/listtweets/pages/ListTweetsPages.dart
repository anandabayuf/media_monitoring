import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:web_media_monitoring/views/listtweets/widgets/ContainerListTweets.dart';
import 'package:web_media_monitoring/views/listtweets/widgets/ContainerTitle.dart';

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
        appBar: AppBar(
          title: ListTile(
            leading: CircleAvatar(
              backgroundImage:
              NetworkImage("assets/images/logo_media_monitoring.png"),
            ),
            title: Text(
              "Media Monitoring",
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            ),
          ),
          bottom: PreferredSize(
              child: Container(
                color: HexColor("#707070"),
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          backgroundColor: HexColor("#101010"),
          toolbarHeight: 80.0,
        ),
        drawer: Drawer(
            child: Container(
              color: HexColor("#101010"),
              child: Column(
                children: [
                  Card(
                    color: HexColor("#101010"),
                    elevation: 10.0,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                          NetworkImage("https://picsum.photos/200"),
                          radius: 50,
                        ),
                        SizedBox(height: screenSize.width < 1920 ? 10 : 5 * 2),
                        Text(
                          "John Doe",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: HexColor("#101010"),
                    elevation: 10.0,
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Cari Berita atau Tweets',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      onTap: () {
                        // Update the state of the app
                        //Navigator.of(context).pushReplacementNamed('/search');
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Card(
                    color: HexColor("#101010"),
                    elevation: 10.0,
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Akun Saya',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      onTap: () {
                        // Update the state of the app
                        Navigator.of(context).pushReplacementNamed(
                            '/myaccount');
                        // Then close the drawer
                        //Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        color: HexColor("#101010"),
                        elevation: 10.0,
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          title: Text(
                            'Keluar',
                            style: TextStyle(fontSize: 15.0, color: Colors.red),
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
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

