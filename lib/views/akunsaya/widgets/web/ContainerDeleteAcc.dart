import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ContainerDeleteAcc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10.0),
      width: 600,
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#707070")),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
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
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Colors.white.withOpacity(0.70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))
                    ),
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
                                elevation: 10.0,
                                primary: Colors.red
                            ),
                            //onPressed: () => Navigator.pop(context, 'Ya, Hapus'),
                            onPressed: () {
                              //logika hapus akun
                              //...
                              Navigator.pop(context, 'Ya, Hapus');
                              //dialog sukses hapus akun
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
                                    "Akun anda berhasil dihapus",
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

                              //logika setelah memencet tombol OK -> berarti otomatis
                              //sesi abis dan keluar -> ke halaman homepage
                            },
                            child: const Text(
                              'Ya, Hapus',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 10.0,
                                primary: HexColor("#707070")
                            ),
                            onPressed: () => Navigator.pop(context, 'Tidak, Kembali'),
                            child: const Text(
                              'Tidak, Kembali',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
