import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class DrawerOperator extends Drawer {
  DrawerOperator(BuildContext context)
    : super(
        child: ColorfulSafeArea(
          color: HexColor("#101010"),
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
                ExpansionTile(
                    collapsedIconColor: Colors.white,
                    iconColor: Colors.white,
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
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          onTap: () {
                            if (ModalRoute.of(context)!.settings.name !=
                                "/news/inputrss") {
                              Navigator.of(context)
                                  .pushReplacementNamed('/news/inputrss');
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
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          onTap: () {
                            if (ModalRoute.of(context)!.settings.name !=
                                "/news/inputlink") {
                              Navigator.of(context)
                                  .pushReplacementNamed('/news/inputlink');
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
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          onTap: () {
                            if (ModalRoute.of(context)!.settings.name !=
                                "/news/inputmanual") {
                              Navigator.of(context)
                                  .pushReplacementNamed('/news/inputmanual');
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                    ]),
                ExpansionTile(
                    collapsedIconColor: Colors.white,
                    iconColor: Colors.white,
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
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
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
          ),
      )
  );
}
