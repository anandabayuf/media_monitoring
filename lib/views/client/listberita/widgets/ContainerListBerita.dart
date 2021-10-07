import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ContainerListBerita extends StatelessWidget{
  late String keyword;
  late Berita _data;
  late List<Berita> _dataList;
  late Map<String, HighlightedWord> words;

  ContainerListBerita(String keyword){
    this.keyword = keyword;
    this._data = Berita("", DateTime.now(), "", "", "");
    this._dataList = this._data.generateDummyBerita();

    timeago.setLocaleMessages('id', timeago.IdMessages());

    this.words = {
      this.keyword: HighlightedWord(
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

    return SizedBox(
      height: isMobile ? screenSize.height - 220 : screenSize.height - 200,
      width: 800,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${this._dataList[index].kategori}",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: HexColor("#BDBBAD")
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Tooltip(
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
                                      locale: 'id'
                                  )}",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: HexColor("#BDBBAD"),
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      child: TextHighlight(
                        text: this._dataList[index].judul,
                        words: this.words,
                        textStyle:TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      child: TextHighlight(
                        overflow: TextOverflow.ellipsis,
                        text: this._dataList[index].konten,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                                "Lihat Berita",
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

class Berita{
  late String kategori;
  late DateTime publishedDate;
  late String judul;
  late String konten;
  late String link;

  Berita(String kategori, DateTime publishedDate, String judul, String konten,
      String link){
    this.kategori = kategori;
    this.publishedDate = publishedDate;
    this.judul = judul;
    this.konten = konten;
    this.link = link;
  }

  List<Berita> generateDummyBerita(){
    return [
      new Berita(
        "Olahraga",
        DateTime.parse("2021-09-30 17:27:00"),
        "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
            "Sentuh RP 42,67",
        "Serikat sempat naik delapan persen setelah Manchester United "
            "menyampaikan ucapan selamat dating untuk",
        "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
      new Berita(
          "Olahraga",
          DateTime.parse("2021-09-30 17:27:00"),
          "Cristiano Ronaldo Kembali, Kapitalisasi Pasar Saham Manchester United "
              "Sentuh RP 42,67",
          "Serikat sempat naik delapan persen setelah Manchester United "
              "menyampaikan ucapan selamat dating untuk",
          "https://www.liputan6.com/saham/read/4643424/cristiano-ronaldo-balik-saham-manchester-united-melonjak"
      ),
    ];
  }
}