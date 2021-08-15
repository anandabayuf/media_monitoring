import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void _logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Monitoring"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: Text("Are you sure want to logout?"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("SIGN OUT"),
                            onPressed: () {
                              _logout();
                              Navigator.of(context).pushReplacementNamed('/');
                            },
                          ),
                        ]);
                  });
            },
          )
        ],
      ),
    );
  }
}
