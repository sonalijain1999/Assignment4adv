

import 'package:assignment4adv/SeekPermission.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SeekPermisssion(),
    );
  }
}
