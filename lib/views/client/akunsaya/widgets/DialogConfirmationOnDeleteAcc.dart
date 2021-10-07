import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/DialogSuccessOnDeleteAcc.dart';

class DialogConfirmationOnDeleteAcc extends StatefulWidget{
  late String email;

  DialogConfirmationOnDeleteAcc(String email){
    this.email = email;
  }

  @override
  _DialogConfirmationOnDeleteAccState createState() => _DialogConfirmationOnDeleteAccState(this.email);
}

class _DialogConfirmationOnDeleteAccState extends State<DialogConfirmationOnDeleteAcc>{
  late TextEditingController _email;
  final _formEmailKey = GlobalKey<FormState>();
  late String email;
  late bool isButtonDisabled;

  _DialogConfirmationOnDeleteAccState(String email){
    this.email = email;
  }

  @override
  void initState() {
    super.initState();
    this.isButtonDisabled = true;
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  void _changeStateButton(){
    setState(() {
      this.isButtonDisabled = !this.isButtonDisabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white.withOpacity(0.70),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Column(
        children: [
          Icon(
            Icons.warning,
            color: Colors.black,
            size: 48.0,
          ),
          SizedBox(height: 30.0,),
          Text(
            "Apakah anda yakin ingin menghapus akun anda?",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0,),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Mohon ketik "
                ),
                TextSpan(
                  text: "${email}",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900
                  ),
                ),
                TextSpan(
                  text: " untuk konfirmasi."
                )
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Form(
            key: this._formEmailKey,
            child: TextFormField(
              controller: this._email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              style: TextStyle(
                fontSize: 15.0,
              ),
              validator: (String? value) {
                if (value != this.email) {
                  return 'email tidak sama';
                }
                return null;
              },
              onChanged: (String value) {
                if (this._formEmailKey.currentState!.validate() && this.isButtonDisabled) {
                  this._changeStateButton();
                } else if(!this._formEmailKey.currentState!.validate() && !this.isButtonDisabled){
                  this._changeStateButton();
                }
              },
              onFieldSubmitted: (String value) {
                if (this._formEmailKey.currentState!.validate()) {
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
                  );

                  //logika setelah memencet tombol OK -> berarti otomatis
                  //sesi abis dan keluar -> ke halaman homepage
                }
              },
            ),
          )
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10.0,
                  primary: Colors.red
              ),
              onPressed: isButtonDisabled ? null : () async {
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
}