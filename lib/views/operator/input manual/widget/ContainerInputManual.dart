import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Controller/newsController.dart';
import 'package:web_media_monitoring/views/client/dashboard/dashboardPage.dart';

class InputManual extends StatefulWidget {
  @override
  _InputManualState createState() => _InputManualState();
}

class _InputManualState extends State<InputManual> {
  String? _valCategory;
  List _listCategory = ["Politik", "Olahraga", "Kuliner"];

  String? _valMedia;
  List _listMedia = [
    "Online(Web Berita)",
    "Cetak(Koran,Majalah,dll)",
    "Lain-Lain"
  ];

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _date;
  late TextEditingController _title;
  late TextEditingController _writer;
  late TextEditingController _content;
  late TextEditingController _link;
  late TextEditingController _publisher;

  late String now;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    now = DateFormat("dd-MMMM-y", 'id').format(DateTime.now());
    _date = TextEditingController(text: now);
    _title = TextEditingController();
    _writer = TextEditingController();
    _content = TextEditingController();
    _link = TextEditingController();
    _publisher = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _date.dispose();
    _title.dispose();
    _writer.dispose();
    _content.dispose();
    _link.dispose();
    _publisher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    NewsController newsController = NewsController(context);
    String deviceID = "";
    String token = "";

    return Container(
      width: screenSize.width,
      color: HexColor("#101010"),
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              "Input Data Berita \nSecara Manual",
              style: TextStyle(fontSize: 32, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            screenSize.width > 960
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Kategori",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        width: 400,
                                        // color: Colors.white,
                                        // padding: EdgeInsets.only(left: 10, right: 10),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              fillColor: Colors.white,
                                              filled: true,
                                            ),
                                            validator: (value) {
                                              if (value == null) {
                                                return "kategori harus diisi";
                                              }
                                              return null;
                                            },
                                            isExpanded: true,
                                            style:
                                                TextStyle(color: Colors.black),
                                            value: _valCategory,
                                            items: _listCategory.map((value) {
                                              return DropdownMenuItem(
                                                child: Text(value,
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                                value: value,
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _valCategory = value.toString();
                                              });
                                            },
                                            hint: Text("pilih kategori",
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Tanggal",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              width: 400,
                                              child: TextFormField(
                                                style: TextStyle(fontSize: 15),
                                                readOnly: true,
                                                controller: _date,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  hintText:
                                                      "masukan tanggal publish berita",
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                ),
                                                validator: (String? value) {
                                                  if (value == "") {
                                                    return "tanggal harus diisi";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 48,
                                              child: ElevatedButton(
                                                child: Icon(
                                                  Icons.calendar_today,
                                                  size: 32,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 10,
                                                  primary: HexColor("#76767A"),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime.now())
                                                      .then((value) {
                                                    if (value != null)
                                                      setState(() {
                                                        now = DateFormat(
                                                                "dd-MMMM-y",
                                                                'id')
                                                            .format(value);
                                                        _date.text = now;
                                                      });
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Judul",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      width: 400,
                                      child: TextFormField(
                                        controller: _title,
                                        style: TextStyle(fontSize: 15),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          hintText: "masukan judul berita",
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        validator: (String? value) {
                                          if (value!.trim() == "") {
                                            return "judul harus diisi";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Penulis",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      width: 400,
                                      child: TextFormField(
                                        controller: _writer,
                                        style: TextStyle(fontSize: 15),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          hintText: "masukan nama penulis",
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        validator: (String? value) {
                                          if (value!.trim() == "") {
                                            return "penulis harus diisi";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Konten",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      width: 400,
                                      child: TextFormField(
                                        controller: _content,
                                        minLines: 6,
                                        maxLines: 7,
                                        style: TextStyle(fontSize: 15),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          hintText: "masukan konten berita",
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        validator: (String? value) {
                                          if (value!.trim() == "") {
                                            return "konten harus diisi";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Link",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      width: 400,
                                      child: TextFormField(
                                        controller: _link,
                                        style: TextStyle(fontSize: 15),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          hintText: "masukan link berita",
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        // validator: (String? value) {
                                        //   if (value == "") {
                                        //     return "link";
                                        //   }
                                        //   return null;
                                        // },
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          // padding: EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Penebit",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      width: 400,
                                      child: TextFormField(
                                        controller: _publisher,
                                        style: TextStyle(fontSize: 15),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          hintText: "masukan nama penerbit",
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        validator: (String? value) {
                                          if (value!.trim() == "") {
                                            return "penerbit harus diisi";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Jenis Media",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        width: 400,
                                        // color: Colors.white,
                                        // padding: EdgeInsets.only(left: 10, right: 10),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              fillColor: Colors.white,
                                              filled: true,
                                            ),
                                            validator: (value) {
                                              if (value == null) {
                                                return "jenis media harus diisi";
                                              }
                                              return null;
                                            },
                                            isExpanded: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                            value: _valMedia,
                                            items: _listMedia.map((value) {
                                              return DropdownMenuItem(
                                                child: Text(value),
                                                value: value,
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _valMedia = value.toString();
                                              });
                                            },
                                            hint: Text("pilih jenis media"),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Kategori",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                                width: 400,
                                // color: Colors.white,
                                // padding: EdgeInsets.only(left: 10, right: 10),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return "kategori harus diisi";
                                      }
                                      return null;
                                    },
                                    isExpanded: true,
                                    style: TextStyle(color: Colors.black),
                                    value: _valCategory,
                                    items: _listCategory.map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value,
                                            style: TextStyle(fontSize: 15)),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _valCategory = value.toString();
                                      });
                                    },
                                    hint: Text("pilih kategori",
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Tanggal",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      width: 400,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 15),
                                        readOnly: true,
                                        controller: _date,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          hintText:
                                              "masukan tanggal publish berita",
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        validator: (String? value) {
                                          if (value == "") {
                                            return "tanggal harus diisi";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 48,
                                      child: ElevatedButton(
                                        child: Icon(
                                          Icons.calendar_today,
                                          size: 32,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          primary: HexColor("#76767A"),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime.now())
                                              .then((value) {
                                            if (value != null)
                                              setState(() {
                                                now = DateFormat("dd-MMMM-y")
                                                    .format(value);
                                                _date.text = now;
                                              });
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Judul",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: 400,
                              child: TextFormField(
                                controller: _title,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  hintText: "masukan judul berita",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (String? value) {
                                  if (value!.trim() == "") {
                                    return "judul harus diisi";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Penulis",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: 400,
                              child: TextFormField(
                                controller: _writer,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  hintText: "masukan nama penulis",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (String? value) {
                                  if (value!.trim() == "") {
                                    return "penulis harus diisi";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Konten",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: 400,
                              child: TextFormField(
                                controller: _content,
                                minLines: 6,
                                maxLines: 7,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  hintText: "masukan konten berita",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (String? value) {
                                  if (value!.trim() == "") {
                                    return "konten harus diisi";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Link",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: 400,
                              child: TextFormField(
                                controller: _link,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  hintText: "masukan link berita",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                // validator: (String? value) {
                                //   if (value == "") {
                                //     return "link";
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Penebit",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: 400,
                              child: TextFormField(
                                controller: _publisher,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  hintText: "masukan nama penerbit",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (String? value) {
                                  if (value!.trim() == "") {
                                    return "penerbit harus diisi";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Jenis Media",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            flex: 5,
                            child: Container(
                                width: 400,
                                // color: Colors.white,
                                // padding: EdgeInsets.only(left: 10, right: 10),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return "jenis media harus diisi";
                                      }
                                      return null;
                                    },
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    value: _valMedia,
                                    items: _listMedia.map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _valMedia = value.toString();
                                      });
                                    },
                                    hint: Text("pilih jenis media"),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                  elevation: 10,
                  primary: HexColor("#76767A"),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  token = prefs.getString("api_token") ?? "undifined";
                  deviceId = prefs.getString("DeviceID") ?? "undifined";
                  if (_formKey.currentState!.validate()) {
                    newsController.inputManual(
                      _valCategory!,
                      _date.text.trim(),
                      _title.text.trim(),
                      _writer.text.trim(),
                      _content.text.trim(),
                      _link.text.trim(),
                      _publisher.text.trim(),
                      _valMedia!,
                      deviceID,
                      token,
                    );
                  

                    print(
                        "kategori: ${_valCategory}\ntanggal: ${_date.text}\njudul: ${_title.text}\npenulis: ${_writer.text}\nkonten: ${_content.text}\nlink: ${_link.text}\npenerbit: ${_publisher.text}\nmedia: ${_valMedia} ");
                    setState(() {
                      _valCategory = null;
                      _date.text = "";
                      _title.text = "";
                      _writer.text = "";
                      _content.text = "";
                      _link.text = "";
                      _publisher.text = "";
                      _valMedia = null;
                    });
                  }
                },
                child: const Text(
                  'Selesai',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
