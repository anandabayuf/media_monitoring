import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DialogEditAvatar extends AlertDialog{
  DialogEditAvatar(BuildContext context):super(
    backgroundColor: Colors.white.withOpacity(0.70),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(32.0)),
    ),
    title: Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://picsum.photos/200"),
          radius: 100,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 10.0,
              primary: Colors.blue),
          onPressed: () => Navigator.pop(
              context, 'Unggah Foto'),
          child: const Text(
            'Unggah Foto',
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 10.0,
              primary: Colors.red),
          onPressed: () => Navigator.pop(
              context, 'Hapus Foto'),
          child: const Text(
            'Hapus Foto',
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white),
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
                elevation: 10.0,
                primary: HexColor(
                    "#76767A"
                )
            ),
            onPressed: () =>
                Navigator.pop(
                    context, 'Batal'
                ),
            child: const Text(
              'Batal',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            style:
            ElevatedButton.styleFrom(
                elevation: 10.0,
                primary:
                Colors.green),
            onPressed: () async {
              // String token = "";
              // String deviceId = "";
              // int id = -1;
              // SharedPreferences prefs =
              //     await SharedPreferences
              //         .getInstance();
              // token = prefs.getString(
              //     "api_token")!;
              // deviceId = prefs
              //     .getString("DeviceID")!;
              // id = prefs.getInt("id")!;
              //API integration

              Navigator.pop(
                  context, 'Simpan');
            },
            child: const Text(
              'Simpan',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white),
            ),
          ),
        ],
      )
    ],
  );
}