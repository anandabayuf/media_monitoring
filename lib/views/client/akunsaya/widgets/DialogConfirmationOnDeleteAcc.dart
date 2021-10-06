import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/DialogSuccessOnDeleteAcc.dart';

class DialogConfirmationOnDeleteAcc extends AlertDialog{
  DialogConfirmationOnDeleteAcc(BuildContext context, String token, String deviceId,
      RestClient api):super(
    backgroundColor: Colors.white.withOpacity(0.70),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    title: Icon(
      Icons.warning,
      color: Colors.black,
      size: 48.0,
    ),
    content: Text(
      "Apakah anda yakin ingin menghapus akun anda?",
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 10.0, primary: Colors.red),
            //onPressed: () => Navigator.pop(context, 'Ya, Hapus'),
            onPressed: () async {
              //logika hapus akun
              //...
              // SharedPreferences pref =
              // await SharedPreferences.getInstance();
              // token = (await pref.getString("api_token"))!;
              // deviceId = (await pref.getString("deviceID"))!;
              //
              // api.deleteUser(2, "notYet", token, deviceId);
              Navigator.pop(context, 'Ya, Hapus');

              //dialog sukses hapus akun
              showDialog<String>(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => DialogSuccessOnDeleteAcc(context)
                //     AlertDialog(
                //   backgroundColor:
                //   Colors.white.withOpacity(0.70),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(
                //           Radius.circular(32.0))),
                //   title: Icon(
                //     Icons.check,
                //     color: Colors.black,
                //     size: 48.0,
                //   ),
                //   content: Text(
                //     "Akun anda berhasil dihapus",
                //     style: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.black,
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                //   actions: <Widget>[
                //     Center(
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             elevation: 10.0,
                //             primary: HexColor("#707070")),
                //         onPressed: () =>
                //             Navigator.pop(context, 'OK'),
                //         child: const Text(
                //           'OK',
                //           style: TextStyle(
                //               fontSize: 15.0,
                //               color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              );

              //logika setelah memencet tombol OK -> berarti otomatis
              //sesi abis dan keluar -> ke halaman homepage
            },
            child: const Text(
              'Ya, Hapus',
              style: TextStyle(
                  fontSize: 15.0, color: Colors.white),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 10.0, primary: HexColor("#707070")),
            onPressed: () =>
                Navigator.pop(context, 'Tidak, Kembali'),
            child: const Text(
              'Tidak, Kembali',
              style: TextStyle(
                  fontSize: 15.0, color: Colors.white),
            ),
          ),
        ],
      )
    ],
  );
}