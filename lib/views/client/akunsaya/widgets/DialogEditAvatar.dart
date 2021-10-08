import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:image_picker/image_picker.dart';

late File uploadimage = File("file.txt"); //variable for choosed file
final picker = ImagePicker();
var choosedimage;

class DialogEditAvatar extends AlertDialog {
  DialogEditAvatar(BuildContext context)
      : super(
          backgroundColor: Colors.white.withOpacity(0.70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          title: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/200"),
                radius: 100,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10.0, primary: Colors.blue),
                onPressed: () async {
                  choosedimage = await ImagePicker.platform
                      .getImage(source: ImageSource.gallery);
                  Navigator.pop(context, 'Unggah Foto');
                },
                child: const Text(
                  'Unggah Foto',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10.0, primary: Colors.red),
                onPressed: () => Navigator.pop(context, 'Hapus Foto'),
                child: const Text(
                  'Hapus Foto',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 10.0, primary: HexColor("#76767A")),
                  onPressed: () => Navigator.pop(context, 'Batal'),
                  child: const Text(
                    'Batal',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 10.0, primary: Colors.green),
                  onPressed: () async {
                    uploadimage = File(choosedimage.path);
                    //API integration
                    String token = "";
                    String deviceId = "";
                    int id = -1;
                    RestClient api = RestClient(Dio());
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    token =
                        "Bearer ${prefs.getString("api_token") ?? "undefined"}";
                    deviceId = prefs.getString("deviceID") ?? "undefined";
                    id = prefs.getInt("id") ?? -1;
                    api.updateImage(id, uploadimage, token, deviceId);

                    Navigator.pop(context, 'Simpan');
                  },
                  child: const Text(
                    'Simpan',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        );
}
