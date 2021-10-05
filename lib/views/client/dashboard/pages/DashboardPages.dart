import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/views/client/AppBarClient.dart';
import 'package:web_media_monitoring/views/client/DrawerClient.dart';
import 'package:web_media_monitoring/views/client/dashboard/dashboardPage.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/BeritaChart.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/ContainerListPublisher.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/ContainerListTweets.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/ContainerTotalBerita.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/ContainerTotalTweets.dart';
import 'package:web_media_monitoring/views/client/dashboard/widgets/TweetsChart.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:web_media_monitoring/controller/authentication.dart';
// import 'package:web_media_monitoring/controller/searchController.dart';
//
// void _logout() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.clear();
// }

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // late SearchController searchController;
  // late String keyword;
  // late String deviceID;
  // late String token;
  // late Authentication authentication;
  late TextEditingController _keyword;
  late int newsTotal;
  late int tweetsTotal;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _keyword = TextEditingController(text: "Manchester United");
    //data dummy
    this.newsTotal = 1230;
    this.tweetsTotal = 980;
  }

  @override
  void dispose() {
    _keyword.dispose();
    super.dispose();
  }

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
                    // Form(
                    //   key: _formKey,
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: <Widget>[
                    //         Container(
                    //           width: 400,
                    //           child: TextFormField(
                    //             controller: _keyword,
                    //             decoration: InputDecoration(
                    //               icon: Icon(
                    //                 Icons.search,
                    //                 color: Colors.white,
                    //                 size: 32.0,
                    //               ),
                    //               border: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(12.0),
                    //               ),
                    //               hintText: 'Masukkan kata kunci',
                    //               fillColor: Colors.white,
                    //               filled: true,
                    //             ),
                    //             validator: (String? value) {
                    //               if (value == '' || value == ' ') {
                    //                 return 'Keyword tidak sesuai';
                    //               }
                    //               return null;
                    //             },
                    //           ),
                    //         ),
                    //         SizedBox(width: 30),
                    //         Container(
                    //           width: 100,
                    //           height: 35,
                    //           child: ElevatedButton(
                    //             style: ElevatedButton.styleFrom(
                    //               textStyle: const TextStyle(fontSize: 15),
                    //               elevation: 10,
                    //               primary: HexColor("#76767A"),
                    //             ),
                    //             onPressed: () {
                    //               if (_formKey.currentState!.validate()) {
                    //                 //buat test masuk atau engga
                    //                 print("Cari " + this._keyword.text);
                    //                 Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                         builder: (context) =>
                    //                             DashboardPage(this._keyword.text)));
                    //               }
                    //             },
                    //             child: const Text(
                    //               'Cari',
                    //               style: TextStyle(fontSize: 15, color: Colors.white),
                    //             ),
                    //           ),
                    //         )
                    //       ]),
                    // ),
                    // SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(left: 40.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dashboard \"${this._keyword.text}\"",
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
                      child: screenSize.width < 960 ?
                      Column (
                        children: [
                          Container(
                            height: 300,
                            width: screenSize.width - 100,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor("#707070")),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: BeritaChart.withSampleData(this._keyword.text),
                          ),
                          SizedBox(height: 10,),
                          Container(
                              height: 300,
                              width: screenSize.width - 100,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: HexColor("#707070")),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: TweetsChart.withSampleData(this._keyword.text)
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ContainerTotalBerita(this._keyword.text, this.newsTotal),
                              SizedBox(width: 20.0,),
                              ContainerTotalTweets(this._keyword.text, this.tweetsTotal),
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
                              child: BeritaChart.withSampleData(this._keyword.text),
                            ),
                          ),
                          SizedBox(width: 30,),
                          Flexible(
                            child: Container(
                                height: 300,
                                width: 400,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: HexColor("#707070")),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: TweetsChart.withSampleData(this._keyword.text)
                            ),
                          ),
                          SizedBox(width: 30,),
                          Column(
                            children: [
                              ContainerTotalBerita(this._keyword.text, this.newsTotal),
                              SizedBox(height: 20.0,),
                              ContainerTotalTweets(this._keyword.text, this.tweetsTotal),
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
                          ContainerListPublisher(this._keyword.text),
                          SizedBox(height: 10.0,),
                          ContainerListTweets(this._keyword.text)
                        ],
                      ):
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContainerListPublisher(this._keyword.text),
                          SizedBox(width: 20.0,),
                          ContainerListTweets(this._keyword.text)
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
