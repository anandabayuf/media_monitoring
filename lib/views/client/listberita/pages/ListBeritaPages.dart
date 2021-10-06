import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/client/AppBarClient.dart';
import 'package:web_media_monitoring/views/client/DrawerClient.dart';
import 'package:web_media_monitoring/views/client/listberita/widgets/ContainerListBerita.dart';
import 'package:web_media_monitoring/views/client/listberita/widgets/ContainerTitle.dart';

class ListBeritaScreen extends StatefulWidget {
  @override
  _ListBeritaScreenState createState() => _ListBeritaScreenState();
}

class _ListBeritaScreenState extends State<ListBeritaScreen> {
  String keyword = "Manchester United";
  String publisher = "Liputan6.com";

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
                    ContainerTitle(this.keyword, this.publisher),
                    SizedBox(height: 10.0,),
                    ContainerListBerita(this.keyword)
                  ],
                )
            ),
          ),
        )
    );
  }
}

