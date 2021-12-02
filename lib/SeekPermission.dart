

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
class SeekPermisssion extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<SeekPermisssion> {
  PermissionStatus _permissionStatus=PermissionStatus.denied;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(onLayoutDone);
  }
  void _askCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      _permissionStatus = await Permission.camera.status;
      setState(() {});
    }
  }

  void onLayoutDone(Duration timeStamp) async {
    _permissionStatus = await Permission.camera.status;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: Color(0xff52b69a),
          title: const Text('Simple permissions'),
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Text(
              '$_permissionStatus',
              style: Theme.of(context).textTheme.headline5,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:  Color(0xff52b69a),
                    textStyle:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

                child: const Text(
                  'Request Permission',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {
                  _askCameraPermission();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

