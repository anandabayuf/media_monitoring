import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget{
  late String keyword;
  late String publisher;

  ContainerTitle(String keyword, String publisher){
    this.keyword = keyword;
    this.publisher = publisher;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1280,
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/newspaper.png",
                width: 32.0,
                height: 32.0,
              ),
              SizedBox(width: 10.0,),
              Flexible(
                child: Text(
                  "Daftar berita yang mengandung \"${this.keyword}\"",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/publisher/liputan6-logo.png",
                width: 32.0,
                height: 32.0,
              ),
              SizedBox(width: 10.0,),
              Text(
                "${this.publisher}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}