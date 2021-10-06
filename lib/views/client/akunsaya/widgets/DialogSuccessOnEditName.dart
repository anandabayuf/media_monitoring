import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DialogSuccessOnEditName extends AlertDialog{
  DialogSuccessOnEditName(BuildContext context):super(
    backgroundColor:
    Colors.white.withOpacity(0.70),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(32.0))),
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
              primary: HexColor("#707070")),
          onPressed: () =>
              Navigator.pop(context, 'OK'),
          child: const Text(
            'OK',
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white),
          ),
        ),
      ),
    ],
  );
}