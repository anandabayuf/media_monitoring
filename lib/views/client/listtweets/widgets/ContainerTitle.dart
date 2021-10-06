import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget{
  late String keyword;

  ContainerTitle(String keyword){
    this.keyword = keyword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1280,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/twitter-icon.png",
            width: 32.0,
            height: 32.0,
          ),
          SizedBox(width: 10.0,),
          Flexible(
            child: Text(
              "Daftar tweets yang mengandung \"${this.keyword}\"",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}