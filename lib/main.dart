import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/mew.png'),
              ),
              Text(
                'Nguyen Hong Loi',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '19211TT1441',
                style: TextStyle(
                    fontFamily: 'Uchen',
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 150,
                height: 20,
                child: Divider(color: Colors.white12),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '056 8442 815',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Uchen',
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'hongloi12123@gmail.com',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Uchen',
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
