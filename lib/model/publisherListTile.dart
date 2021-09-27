import 'package:flutter/material.dart';
import 'package:web_media_monitoring/model/publisherModel.dart';

Widget publisherListTile(PublisherModel publisher, BuildContext context) {
  return ListView.builder(
    itemBuilder: (context, position) {
      return GestureDetector(
        child: Card(
          elevation: 2.0,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    publisher.publisher,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    publisher.total.toString(),
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
