import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:intl/intl.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ContainerListTweets extends StatelessWidget {
  late String _keyword;
  late Tweets _data;
  late List<Tweets> _dataList;
  late Map<String, HighlightedWord> words;

  ContainerListTweets(String keyword){
    this._keyword = keyword;

    this._data = Tweets("", "", "", "", DateTime.now(), "", "", "", "", "");
    this._dataList = this._data.generateDummyTweets();

    timeago.setLocaleMessages('id', timeago.IdMessages());

    this.words = {
      this._keyword: HighlightedWord(
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w900,
          backgroundColor: Colors.yellow
        ), onTap: () {  },
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width < 960;

    return Container(
      width: isMobile ? screenSize.width - 10 : 500,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#707070")),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/icons/twitter-icon.png",
                height: 32.0, width: 32.0,
              ),
              SizedBox(width: 10.0,),
              Flexible(
                child: Text(
                  "Daftar tweets yang mengandung \"${this._keyword}\"",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w100
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenSize.height/3,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Card(
                                color: HexColor("#415A80"),
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  this._dataList[index].iconDirectory,
                                                  height: 32.0,
                                                  width: 32.0,
                                                ),
                                                SizedBox(width: 10.0,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      this._dataList[index].name,
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                    SizedBox(width: 5.0,),
                                                    Text(
                                                      "@${this._dataList[index].username}",
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: HexColor("#BDBBAD")
                                                      ),
                                                    ),
                                                    Text(
                                                      " • ",
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                    Text(
                                                      "${this._dataList[index].followers} Followers",
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: HexColor("#BDBBAD")
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Tooltip(
                                                message: "${DateFormat('dd-MMMM-y HH:mm:ss').format(this._dataList[index].publishedDate)}",
                                                decoration: ShapeDecoration(
                                                    color: Colors.black,
                                                    shape: StadiumBorder()
                                                ),
                                                child: Row(
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons.calendarAlt,
                                                      size: 12.0,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(width: 5.0,),
                                                    Text(
                                                      "${timeago.format(
                                                          new DateTime.now().subtract(
                                                              new Duration(
                                                                  seconds: DateTime.now().difference(this._dataList[index].publishedDate).inSeconds
                                                              )
                                                          ),
                                                          locale: isMobile ? 'en_short':'id'
                                                      )}",
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: HexColor("#BDBBAD"),
                                                          decoration: TextDecoration.underline
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Container(
                                        child: TextHighlight(
                                          overflow: TextOverflow.ellipsis,
                                          text: this._dataList[index].tweet,
                                          words: this.words,
                                          textStyle:TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w100
                                          ),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      SizedBox(height: 10.0,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.comment,
                                                color: Colors.black,
                                                size: 12.0,
                                              ),
                                              SizedBox(width: 5.0,),
                                              Text(
                                                this._dataList[0].comments,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white
                                                ),
                                              ),
                                              SizedBox(width: 10.0,),
                                              FaIcon(
                                                FontAwesomeIcons.retweet,
                                                color: Colors.black,
                                                size: 12.0,
                                              ),
                                              SizedBox(width: 5.0,),
                                              Text(
                                                this._dataList[0].reTweets,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white
                                                ),
                                              ),
                                              SizedBox(width: 10.0,),
                                              FaIcon(
                                                FontAwesomeIcons.heart,
                                                color: Colors.black,
                                                size: 12.0,
                                              ),
                                              SizedBox(width: 5.0,),
                                              Text(
                                                this._dataList[0].likes,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white
                                                ),
                                              )
                                            ],
                                          ),
                                          InkWell(
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.externalLinkAlt,
                                                  size: 12.0,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(width: 5.0,),
                                                Text(
                                                  "Lihat Tweet",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: HexColor("#BDBBAD"),
                                                      decoration: TextDecoration.underline
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () async {
                                              var url = this._dataList[index].link;
                                              if (await canLaunch(url)) {
                                                await launch(url);
                                              } else {
                                                throw "Could not launch ${url}";
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        width: 300,
                        child: ElevatedButton(
                          child: Text(
                            "Tampilkan lebih banyak",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                            elevation: 10,
                            primary: HexColor("#76767A"),
                          ),
                          onPressed: () {
                            print("Clicked tampilkan lebih banyak");
                            Navigator.pushNamed(
                              context,
                              "/dashboard/listtweets",
                              arguments: this._keyword
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}

class Tweets{
  late String iconDirectory;
  late String name;
  late String username;
  late String followers;
  late DateTime publishedDate;
  late String tweet;
  late String link;
  late String comments;
  late String reTweets;
  late String likes;

  Tweets(String iconDirectory, String name, String username, String followers,
      DateTime publishedDate, String tweet, String link, String comments,
      String reTweets, String likes){
    this.iconDirectory = iconDirectory;
    this.name = name;
    this.username = username;
    this.followers = followers;
    this.publishedDate = publishedDate;
    this.tweet = tweet;
    this.link = link;
    this.comments = comments;
    this.reTweets = reTweets;
    this.likes = likes;
  }



  List<Tweets> generateDummyTweets(){
    return [
      new Tweets("assets/images/twitteruser/goal.png", "Goal", "goal", "2.8M",
          DateTime.parse("2021-10-01 14:30:00"),
          "to Jose Mourinho, Manchester United scored 5 goals or more in a "
              "game twice",
          "https://twitter.com/sportbible/status/1426900396979761154", "191",
      "1.3K", "13.9K"),
      new Tweets("assets/images/twitteruser/sportbible.png", "SPORTbible",
          "SPORTbible", "1.4M", DateTime.parse("2021-09-30 17:27:00"),
          "paul pogra provided four assists in Manchester United's first game of "
              "the season",
          "https://twitter.com/Squawka/status/1426528813312356354", "191",
          "1.3K", "13.9K"),
      new Tweets("assets/images/twitteruser/totalcristiano.png", "TC",
          "totalcristioano", "2.8M", DateTime.parse("2021-09-30 20:20:00"),
          "Cristiano Ronaldo at manchester united was out of this world",
          "https://twitter.com/sportbible/status/1426900396979761154", "191",
          "1.3K", "13.9K"),
    ];
  }
}