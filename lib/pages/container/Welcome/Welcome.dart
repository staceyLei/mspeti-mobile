import 'package:educationapp/provider/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:educationapp/assets/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> {
  int _count = 5;
  Timer _timerPeriod;
  bool _isLogin;
  @override
  void initState() {
    super.initState();
    this._timerPeriod = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (this._count <= 1) {
        this._cancelTimer();
        this._jumpToTab(_isLogin);
      } else {
        setState(() {
          this._count -= 1;
        });
      }
    });
  }

  _cancelTimer() {
    this._timerPeriod.cancel();
    this._timerPeriod = null;
  }

  _jumpToTab(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String schoolId = prefs.getString('schoolId') ?? '';
    var route = schoolId.isNotEmpty ? '/Login' : '/SelectSchool';
    if (isLogin) {
      route = '/';
    }
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  void dispose() {
    //手动跳转时清除定时器
    super.dispose();
    if (this._timerPeriod != null) {
      this._cancelTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);
    _isLogin = user.isLogin;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/image/welcome.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment(0.6, 0.6),
              child: InkWell(
                onTap: () => _jumpToTab(_isLogin),
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: loadingColor,
                  ),
                  child: Text(
                    '跳过(${this._count}s)',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
