import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/client/AppBarClient.dart';
import 'package:web_media_monitoring/views/client/DrawerClient.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/BeritaChart.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/ContainerListPublisher.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/ContainerListTweets.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/ContainerTotalBerita.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/ContainerTotalTweets.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/TweetsChart.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int newsTotal;
  late int tweetsTotal;
  late String keyword;

  _DashboardScreenState(){
    this.newsTotal = 1230;
    this.tweetsTotal = 980;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width < 960;
    this.keyword = ModalRoute.of(context)!.settings.arguments as String;

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
                    Container(
                      margin: EdgeInsets.only(left: isMobile ? 0 : 40.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dashboard \"${this.keyword}\"",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 1280,
                      child: isMobile ?
                      Column (
                        children: [
                          Container(
                            height: 300,
                            width: screenSize.width - 10,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor("#707070")),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: BeritaChart.withSampleData(this.keyword),
                          ),
                          SizedBox(height: 10,),
                          Container(
                              height: 300,
                              width: screenSize.width - 10,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: HexColor("#707070")),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: TweetsChart.withSampleData(this.keyword)
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ContainerTotalBerita(this.keyword, this.newsTotal),
                              SizedBox(width: 20.0,),
                              ContainerTotalTweets(this.keyword, this.tweetsTotal),
                            ],
                          )
                        ],
                      ) :
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              height: 300,
                              width: 400,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: HexColor("#707070")),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: BeritaChart.withSampleData(this.keyword),
                            ),
                          ),
                          SizedBox(width: screenSize.width < 1280 ? 10.0 :  30,),
                          Flexible(
                            child: Container(
                                height: 300,
                                width: 400,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: HexColor("#707070")),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: TweetsChart.withSampleData(this.keyword)
                            ),
                          ),
                          SizedBox(width: screenSize.width < 1280 ? 10.0:  30,),
                          Column(
                            children: [
                              ContainerTotalBerita(this.keyword, this.newsTotal),
                              SizedBox(height: 20.0,),
                              ContainerTotalTweets(this.keyword, this.tweetsTotal),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: screenSize.width < 960 ?
                      Column (
                        children: [
                          ContainerListPublisher(this.keyword),
                          SizedBox(height: 10.0,),
                          ContainerListTweets(this.keyword)
                        ],
                      ):
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContainerListPublisher(this.keyword),
                          SizedBox(width: 20.0,),
                          ContainerListTweets(this.keyword)
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}
