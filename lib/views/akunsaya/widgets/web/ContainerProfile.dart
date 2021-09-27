import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ContainerProfile extends StatefulWidget {
  @override
  _ContainerProfileState createState() => _ContainerProfileState();
}

class _ContainerProfileState extends State<ContainerProfile> {
  String username = "John Doe";
  String email = "johndoe@gmail.com";
  String password = "••••••••";
  String passwordOpen = "johndoe123";
  bool isEditUsername = false;
  bool isEditPassword = false;

  late TextEditingController _username;
  late TextEditingController _oldPassword;
  late TextEditingController _newPassword;
  late TextEditingController _confirmationPassword;
  final _formUsernameKey = GlobalKey<FormState>();
  final _formPasswordKey = GlobalKey<FormState>();

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

    return Container(
      padding: EdgeInsets.all(10.0),
      width: 600,
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#707070")),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                this.isEditUsername ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Form(
                    key: this._formUsernameKey,
                    child: Container(
                      width: 300,
                      child: TextFormField(
                        controller: this._username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'Masukkan nama anda...',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        maxLength: 25,
                        maxLines: 1,
                        validator: (String? value) {
                          if (value == '' || value == ' ') {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ) :
                Text(
                  this.username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: this.isEditUsername ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                          elevation: 10,
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          setState((){
                            this.isEditUsername = !this.isEditUsername;
                          });
                        },
                        child: const Text(
                          'Batal',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: screenSize.width < 1920 ? 10 : 5 * 2),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                          elevation: 10,
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          if (_formUsernameKey.currentState!.validate()) {
                            //print(this._username.text);
                            this.username = this._username.text;
                            setState((){
                              this.isEditUsername = !this.isEditUsername;
                            });
                            showDialog<String>(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: Colors.white.withOpacity(0.70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                                ),
                                title: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: 48.0,
                                ),
                                content: Text(
                                  "Nama berhasil diubah",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 10.0,
                                          primary: HexColor("#707070")
                                      ),
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Simpan',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )
                    ],
                  ) : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      elevation: 10,
                      primary: HexColor("#76767A"),
                    ),
                    onPressed: () {
                      _username = TextEditingController(text: this.username);
                      setState((){
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
            this.isEditPassword ? Align(
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
                              filled: true),
                          validator: (String? value) {
                            if (value == '') {
                              return 'Password lama harus diisi';
                            }
                            //nanti ganti sama password asli? atau ada pengecekan
                            //di backend aja? kayanya backend deh biar safe
                            //sementara cuma ngecek aja jadi pake variable
                            else if (value != this.passwordOpen) {
                              return 'Password salah';
                            }
                            return null;
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
                              filled: true),
                          validator: (String? value) {
                            if (value == '') {
                              return 'Password baru harus diisi';
                            } else if(value!.contains(' ')) {
                              return 'Password tidak boleh mengandung spasi';
                            }
                            return null;
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
                              hintText: 'Masukkan kembali password baru anda...',
                              fillColor: Colors.white,
                              filled: true),
                          validator: (String? value) {
                            if (value == '') {
                              return 'Konfirmasi password harus diisi';
                            } else if (value != this._newPassword.text) {
                              return 'Password tidak sama';
                            }
                            return null;
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
                                setState((){
                                  this.isEditPassword = !this.isEditPassword;
                                });
                              },
                              child: const Text(
                                'Batal',
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: screenSize.width < 1920 ? 10 : 5 * 2),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15),
                                elevation: 10,
                                primary: Colors.green,
                              ),
                              onPressed: () {
                                if (_formPasswordKey.currentState!.validate()) {
                                  setState((){
                                    this.isEditPassword = !this.isEditPassword;
                                  });
                                  showDialog<String>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      backgroundColor: Colors.white.withOpacity(0.70),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(32.0))
                                      ),
                                      title: Icon(
                                        Icons.check,
                                        color: Colors.black,
                                        size: 48.0,
                                      ),
                                      content: Text(
                                        "Password berhasil diubah",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        Center(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 10.0,
                                                primary: HexColor("#707070")
                                            ),
                                            onPressed: () => Navigator.pop(context, 'OK'),
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                'Simpan',
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ): Row(
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
                  onPressed: ()  {
                    setState((){
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
