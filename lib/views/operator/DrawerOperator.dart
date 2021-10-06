import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class DrawerOperator extends Drawer {
  DrawerOperator(BuildContext context)
      : super(
            child: Container(
          color: HexColor("#101010"),
          child: Column(
            children: [
              Card(
                color: HexColor("#101010"),
                elevation: 10.0,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://picsum.photos/200"),
                      radius: 50,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.width < 1920
                            ? 10
                            : 5 * 2),
                    Text(
                      "John Doe",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ExpansionCard(
                  margin: EdgeInsets.zero,
                  title: Card(
                    color: HexColor("#101010"),
                    elevation: 10.0,
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.newspaper,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Input Berita',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      onTap: () {
                        // if (ModalRoute.of(context)!.settings.name !=
                        //     "") {
                        //   Navigator.of(context)
                        //       .pushReplacementNamed('/myaccount');
                        // } else {
                        //   Navigator.pop(context);
                        // }
                      },
                    ),
                  ),
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(left: 30),
                      color: HexColor("#101010"),
                      elevation: 10.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.rss_feed,
                          color: Colors.white,
                        ),
                        title: Text(
                          'RSS',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onTap: () {
                          if (ModalRoute.of(context)!.settings.name !=
                              "/berita/inputrss") {
                            Navigator.of(context)
                                .pushReplacementNamed('/berita/inputrss');
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30),
                      color: HexColor("#101010"),
                      elevation: 10.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.link,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Link',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onTap: () {
                          if (ModalRoute.of(context)!.settings.name !=
                              "/berita/inputlink") {
                            Navigator.of(context)
                                .pushReplacementNamed('/berita/inputlink');
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30),
                      color: HexColor("#101010"),
                      elevation: 10.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Manual',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onTap: () {
                          if (ModalRoute.of(context)!.settings.name !=
                              "/berita/inputmanual") {
                            Navigator.of(context)
                                .pushReplacementNamed('/berita/inputmanual');
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ]),
              ExpansionCard(
                  margin: EdgeInsets.zero,
                  title: Card(
                    color: HexColor("#101010"),
                    elevation: 10.0,
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Input Tweet',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      onTap: () {
                        //   if (ModalRoute.of(context)!.settings.name !=
                        //       "/myaccount") {
                        //     Navigator.of(context)
                        //         .pushReplacementNamed('/myaccount');
                        //   } else {
                        //     Navigator.pop(context);
                        //   }
                      },
                    ),
                  ),
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(left: 30),
                      color: HexColor("#101010"),
                      elevation: 10.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.link,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Link',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onTap: () {
                          // Update the state of the app
                          // Navigator.of(context).pushReplacementNamed('/operator');

                          // Then close the drawer
                          //Navigator.pop(context);
                        },
                      ),
                    ),
                  ]),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    margin: EdgeInsets.only(left: 20),
                    color: HexColor("#101010"),
                    elevation: 10.0,
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Keluar',
                        style: TextStyle(fontSize: 15.0, color: Colors.red),
                      ),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
}
