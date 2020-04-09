import 'dart:io';

import 'package:buchang_education/common/common.dart';
import 'package:buchang_education/utils/route_util.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

String adPicturePath;
File adPictureFile;

class SplashRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashRouteState();
  }
}

class _SplashRouteState extends State<SplashRoute> {
  TimerUtil _timerUtil;
  int _count = 3;

  Future<String> getAdPicture() async {
    String path = (await getExternalStorageDirectory()).path;
    adPicturePath = path + Common.adImageName;
    setState(() {
      adPictureFile = File(adPicturePath);
    });
    return path;
  }

  void _doCountDown() {
    _timerUtil = new TimerUtil(mTotalTime: 3 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_count == 0) {
        Fluttertoast.showToast(
            msg: "GO MAIN",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
        RouteUtil.goMain(context);
      }
    });
    _timerUtil.startCountDown();
  }

  @override
  void initState() {
    getAdPicture();
    _doCountDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildSplashBg() {
      return ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: adPictureFile != null && adPictureFile.existsSync()
            ? Image.file(
                adPictureFile,
                fit: BoxFit.cover,
              )
            : Image.asset(
                "assets/images/awp.jpg",
                fit: BoxFit.cover,
              ),
      );
    }

    Widget _buildSplashButton() {
      return Positioned(
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: (() {
            if (_count <= 0) {
              RouteUtil.goMain(context);
            } else {
              Fluttertoast.showToast(
                  msg: "WAIT",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }),
          child: Text(_count <= 0 ? "跳过" : "$_count S"),
        ),
        bottom: 50,
        right: 50,
      );
    }

    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[_buildSplashBg(), _buildSplashButton()],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null) _timerUtil.cancel(); //记得中dispose里面把timer cancel。
  }
}
