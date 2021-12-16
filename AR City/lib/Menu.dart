

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Maps.dart';
import 'auth/helloWorld.dart';


void main() {
  runApp(MenuScreen());
}


class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Menu'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 280),
              width: 150.0,
              height: 70.0,
              child: FlatButton(
                child: Text('Open Camera', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelloWorld(),
                  ),
                );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 150.0,
              height: 70.0,
              child: FlatButton(
                child: Text('Open Maps', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapScreen(),
                    ),
                  );
                },
              ),
            )
          ]
          ))
      ),
    );
  }
}