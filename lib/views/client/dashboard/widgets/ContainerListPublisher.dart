import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class ContainerListPublisher extends StatelessWidget {
  late String _keyword;
  late Publisher _data;
  late List<Publisher> _dataList;

  ContainerListPublisher(String keyword){
    this._keyword = keyword;
    this._data = Publisher("", "", 0);
    this._dataList = this._data.generateDummyPublisher();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width < 960;

    return Container(
      width: isMobile ? screenSize.width - 10 : 400,
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
              Image.asset("assets/icons/newspaper.png", height: 32.0, width: 32.0,),
              SizedBox(width: 10.0,),
              Flexible(
                child: Text(
                  "Daftar penerbit yang mengandung \"${this._keyword}\"",
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
                child: SizedBox(
                  height: screenSize.height/3,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: this._dataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: HexColor("#415A80"),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            this._dataList[index].iconDirectory,
                            height: 32.0,
                            width: 32.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                this._dataList[index].name,
                                style: TextStyle(fontSize: 15.0, color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${this._dataList[index].totalNews} berita",
                                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                                  ),
                                  SizedBox(width: 10.0,),
                                  FaIcon(
                                    FontAwesomeIcons.arrowCircleRight,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          ),
                          onTap: () {
                            print("clicked publisher ke-${index}");
                            Navigator.pushNamed(
                              context,
                              "/dashboard/listberita",
                              arguments: {
                                'keyword' : this._keyword,
                                'publisher' : this._dataList[index].name,
                                'iconpublisher' : this._dataList[index].iconDirectory
                              }
                            );
                          },
                        ),
                      );
                    }
              ),
                ),
            ),
          )
          )
        ],
      ),
    );
  }
}

class Publisher{
  late String iconDirectory;
  late String name;
  late int totalNews;

  Publisher(String iconDirectory, String name, int totalNews){
    this.iconDirectory = iconDirectory;
    this.name = name;
    this.totalNews = totalNews;
  }



  List<Publisher> generateDummyPublisher(){
    return [
      new Publisher(
        "assets/images/publisher/liputan6-logo.png",
        "Liputan6.com",
        890
      ),
      new Publisher(
        "assets/images/publisher/detik-logo.png",
        "detikcom",
        744
      ),
      new Publisher(
        "assets/images/publisher/kompas-logo.png",
        "kompas.com",
        567
      ),
      new Publisher(
        "assets/images/publisher/tempoco-logo.png",
        "Tempo.co",
        435
      ),
      new Publisher(
        "assets/images/publisher/kumparan-logo.png",
        "kumparan",
        760
      ),
      new Publisher(
        "assets/images/publisher/tribunnews-logo.png",
        "Tribunnews",
        760
      ),
    ];
  }
}