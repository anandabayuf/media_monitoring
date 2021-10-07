import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/DialogConfirmationOnDeleteAcc.dart';

class ContainerDeleteAcc extends StatelessWidget {
  late String email;

  ContainerDeleteAcc(String email){
    this.email = email;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool mobile = screenSize.width < 800;
    RestClient api = RestClient(Dio());
    String token = "";
    String deviceId = "";

    return Container(
      padding: EdgeInsets.all(10.0),
      width: 600,
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#707070")),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: mobile ? 5.0 : 20.0,
            right: mobile ? 5.0 : 20.0,
            top: 10.0,
            bottom: 10.0
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hapus Akun",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
                elevation: 10,
                primary: Colors.red,
              ),
              onPressed: () {
                showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => DialogConfirmationOnDeleteAcc(this.email)
                );
              },
              child: const Text(
                'Hapus Akun',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void Success() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();

//   String deviceID;
//   deviceID = await preferences.getString("deviceID");
// }
