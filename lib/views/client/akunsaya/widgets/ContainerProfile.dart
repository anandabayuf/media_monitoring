import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/DialogSuccessOnEditName.dart';
import 'package:web_media_monitoring/views/client/akunsaya/widgets/DialogSuccessOnEditPassword.dart';

class ContainerProfile extends StatefulWidget {
  late String username;
  late String email;
  late String password;
  late String passwordOpen;

  ContainerProfile(String username, String email, String password,
      String passwordOpen){
    this.username = username;
    this.email = email;
    this.password = password;
    this.passwordOpen = passwordOpen;
  }

  @override
  _ContainerProfileState createState() => _ContainerProfileState(this.username,
  this.email, this.password, this.passwordOpen);
}

class _ContainerProfileState extends State<ContainerProfile> {
  late String username;
  late String email;
  late String password;
  late String passwordOpen;
  bool isEditUsername = false;
  bool isEditPassword = false;

  late TextEditingController _username;
  late TextEditingController _oldPassword;
  late TextEditingController _newPassword;
  late TextEditingController _confirmationPassword;
  final _formUsernameKey = GlobalKey<FormState>();
  final _formPasswordKey = GlobalKey<FormState>();

  _ContainerProfileState(String username, String email, String password,
      String passwordOpen){
    this.username = username;
    this.email = email;
    this.password = password;
    this.passwordOpen = passwordOpen;
  }

  @override
  void initState() {
    super.initState();
    _username = TextEditingController(text: this.username);
    _oldPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmationPassword = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _oldPassword.dispose();
    _newPassword.dispose();
    _confirmationPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool mobile = screenSize.width < 800;
    RestClient api = RestClient(Dio());

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nama",
                style: TextStyle(
                  color: HexColor("#999999"),
                  fontSize: 15.0,
                ),
              ),
            ),
            this.isEditUsername ?
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 300,
                child: Form(
                  key: this._formUsernameKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        width: 300,
                        child: TextFormField(
                          controller: this._username,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: 'masukkan nama anda...',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          validator: (String? value) {
                            if (value == '' || value == ' ' || value!.trim() == '') {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                          },
                          onChanged: (String value) {
                            if (_formUsernameKey.currentState!.validate()) {}
                          },
                          onFieldSubmitted: (String value) {
                            if (_formUsernameKey.currentState!.validate()) {
                              //print(this._username.text);
                              // String token = "";
                              // String deviceId = "";
                              // int id = -1;
                              this.username = this._username.text.trim();
                              // SharedPreferences prefs =
                              //     await SharedPreferences.getInstance();
                              // token = prefs.getString("api_token")!;
                              // deviceId = prefs.getString("deviceID")!;
                              // id = prefs.getInt("id")!;
                              // print("token: $token");
                              // print("deviceID: $deviceId");
                              // print("id = $id");
                              // api.updateName(
                              //     id, this.username, token, deviceId);

                              setState(() {
                                this.isEditUsername = !this.isEditUsername;
                              });
                              showDialog<String>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) => DialogSuccessOnEditName(context)
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                              elevation: 10,
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                this.isEditUsername = !this.isEditUsername;
                              });
                            },
                            child: const Text(
                              'Batal',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                              elevation: 10,
                              primary: Colors.green,
                            ),
                            onPressed: () async {
                              if (_formUsernameKey.currentState!.validate()) {
                                //print(this._username.text);
                                // String token = "";
                                // String deviceId = "";
                                // int id = -1;
                                this.username = this._username.text.trim();
                                // SharedPreferences prefs =
                                //     await SharedPreferences.getInstance();
                                // token = prefs.getString("api_token")!;
                                // deviceId = prefs.getString("deviceID")!;
                                // id = prefs.getInt("id")!;
                                // print("token: $token");
                                // print("deviceID: $deviceId");
                                // print("id = $id");
                                // api.updateName(
                                //     id, this.username, token, deviceId);

                                setState(() {
                                  this.isEditUsername = !this.isEditUsername;
                                });
                                showDialog<String>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) => DialogSuccessOnEditName(context)
                                );
                              }
                            },
                            child: const Text(
                              'Simpan',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ) :
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                    elevation: 10,
                    primary: HexColor("#76767A"),
                  ),
                  onPressed: () {
                    _username = TextEditingController(text: this.username);
                    setState(() {
                      if (isEditPassword) {
                        this.isEditPassword = !this.isEditPassword;
                      }
                      this.isEditUsername = !this.isEditUsername;
                    });
                  },
                  child: const Text(
                    'Ubah',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: HexColor("#999999"),
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  this.email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  this.isEditPassword ? "Password Lama" : "Password",
                  style: TextStyle(
                    color: HexColor("#999999"),
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            this.isEditPassword ?
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 300,
                child: Form(
                  key: this._formPasswordKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        width: 300,
                        child: TextFormField(
                          controller: this._oldPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: 'Masukkan password lama anda...',
                            fillColor: Colors.white,
                            filled: true
                          ),
                          validator: (String? value) {
                            if (value == '' || value!.trim() == '') {
                              return 'Password lama harus diisi';
                            }
                            else if (value != this.passwordOpen) {
                              return 'Password salah';
                            }
                            return null;
                          },
                          onChanged: (String value) {
                            if (_formPasswordKey.currentState!.validate()) {}
                          },
                          onFieldSubmitted: (String value){
                            if (_formPasswordKey.currentState!.validate()) {
                              String newPassword = _newPassword.text;
                              String oldPassword = _oldPassword.text;
                              // String token = "";
                              // String deviceId = "";
                              // int id = -1;
                              // SharedPreferences prefs =
                              //     await SharedPreferences
                              //         .getInstance();
                              // token = prefs.getString("api_token")!;
                              // deviceId = prefs.getString("deviceID")!;
                              // id = prefs.getInt("id")!;
                              // print("token: $token");
                              // print("deviceID: $deviceId");
                              // print("id = $id");
                              //
                              // api.updatePassword(id, oldPassword,
                              //     newPassword, token, deviceId);
                              setState(() {
                                this.isEditPassword = !this.isEditPassword;
                              });
                              showDialog<String>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DialogSuccessOnEditPassword(context)
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password Baru",
                            style: TextStyle(
                              color: HexColor("#999999"),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.only(top: 5.0),
                        child: TextFormField(
                          controller: this._newPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: 'Masukkan password baru anda...',
                            fillColor: Colors.white,
                            filled: true
                          ),
                          validator: (String? value) {
                            if (value == '' || value!.trim() == '') {
                              return 'Password baru harus diisi';
                            } else if (value.contains(' ')) {
                              return 'Password tidak boleh mengandung spasi';
                            } else if(value.length < 8) {
                              return 'Password harus terdiri setidaknya 8 karakter';
                            }
                            return null;
                          },
                          onChanged: (String value) {
                            if (_formPasswordKey.currentState!.validate()) {}
                          },
                          onFieldSubmitted: (String value){
                            if (_formPasswordKey.currentState!.validate()) {
                              String newPassword = _newPassword.text;
                              String oldPassword = _oldPassword.text;
                              // String token = "";
                              // String deviceId = "";
                              // int id = -1;
                              // SharedPreferences prefs =
                              //     await SharedPreferences
                              //         .getInstance();
                              // token = prefs.getString("api_token")!;
                              // deviceId = prefs.getString("deviceID")!;
                              // id = prefs.getInt("id")!;
                              // print("token: $token");
                              // print("deviceID: $deviceId");
                              // print("id = $id");
                              //
                              // api.updatePassword(id, oldPassword,
                              //     newPassword, token, deviceId);
                              setState(() {
                                this.isEditPassword = !this.isEditPassword;
                              });
                              showDialog<String>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DialogSuccessOnEditPassword(context)
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Konfirmasi Password Baru",
                            style: TextStyle(
                              color: HexColor("#999999"),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        width: 300,
                        child: TextFormField(
                          controller: this._confirmationPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText:
                                  'Masukkan kembali password baru anda...',
                              fillColor: Colors.white,
                              filled: true),
                          validator: (String? value) {
                            if (value == '' || value!.trim() == '') {
                              return 'Konfirmasi password harus diisi';
                            } else if (value != this._newPassword.text) {
                              return 'Password tidak sama';
                            }
                            return null;
                          },
                          onChanged: (String value) {
                            if (_formPasswordKey.currentState!.validate()) {}
                          },
                          onFieldSubmitted: (String value){
                            if (_formPasswordKey.currentState!.validate()) {
                              String newPassword = _newPassword.text;
                              String oldPassword = _oldPassword.text;
                              // String token = "";
                              // String deviceId = "";
                              // int id = -1;
                              // SharedPreferences prefs =
                              //     await SharedPreferences
                              //         .getInstance();
                              // token = prefs.getString("api_token")!;
                              // deviceId = prefs.getString("deviceID")!;
                              // id = prefs.getInt("id")!;
                              // print("token: $token");
                              // print("deviceID: $deviceId");
                              // print("id = $id");
                              //
                              // api.updatePassword(id, oldPassword,
                              //     newPassword, token, deviceId);
                              setState(() {
                                this.isEditPassword = !this.isEditPassword;
                              });
                              showDialog<String>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DialogSuccessOnEditPassword(context)
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15),
                                elevation: 10,
                                primary: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  this.isEditPassword =
                                      !this.isEditPassword;
                                });
                              },
                              child: const Text(
                                'Batal',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15),
                                elevation: 10,
                                primary: Colors.green,
                              ),
                              onPressed: () async {
                                if (_formPasswordKey.currentState!.validate()) {
                                  String newPassword = _newPassword.text;
                                  String oldPassword = _oldPassword.text;
                                  // String token = "";
                                  // String deviceId = "";
                                  // int id = -1;
                                  // SharedPreferences prefs =
                                  //     await SharedPreferences
                                  //         .getInstance();
                                  // token = prefs.getString("api_token")!;
                                  // deviceId = prefs.getString("deviceID")!;
                                  // id = prefs.getInt("id")!;
                                  // print("token: $token");
                                  // print("deviceID: $deviceId");
                                  // print("id = $id");
                                  //
                                  // api.updatePassword(id, oldPassword,
                                  //     newPassword, token, deviceId);
                                  setState(() {
                                    this.isEditPassword = !this.isEditPassword;
                                  });
                                  showDialog<String>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DialogSuccessOnEditPassword(context)
                                  );
                                }
                              },
                              child: const Text(
                                'Simpan',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ) :
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.password,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                    elevation: 10,
                    primary: HexColor("#76767A"),
                  ),
                  onPressed: () {
                    setState(() {
                      if (isEditUsername) {
                        this.isEditUsername = !this.isEditUsername;
                      }
                      this.isEditPassword = !this.isEditPassword;
                      this._oldPassword.clear();
                      this._newPassword.clear();
                      this._confirmationPassword.clear();
                    });
                  },
                  child: const Text(
                    'Ubah',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
