import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:educationapp/store/action/userAction.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  var arguments;
  Login({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  int _loginType = 0; //0 免密登录 1 密码登录
  String _phone = '';
  bool _isShow = true; //密码是否隐藏
  String _password = '';
  String _username = '';
  String _smsCode = '';
  bool _disabled = true;
  Map _schoolData = {};
  final _phonController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _smscodeController = TextEditingController();
  bool _isGetCode = false;
  int _restTime = 10;
  Timer _myTimer;
  SharedPreferences _prefs;
  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _initData() async {
    _prefs = await SharedPreferences.getInstance();
    this.setState(() {
      this._schoolData = {
        "name": _prefs.getString('schoolName'),
        "id": _prefs.getString("schoolId")
      };
    });
  }

  @override
  void dispose() {
    this._phonController.dispose();
    _passwordController.dispose();
    _smscodeController.dispose();
    _handleCleanTimer();
    super.dispose();
  }

  handleClean(inputVal) {
    setState(() {
      inputVal = '';
    });
  }

  onCancel(TextEditingController controller) {
    // 保证在组件build的第一帧时才去触发取消清空内容
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.clear());
  }

  _handleGetCode() {
    _myTimer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _restTime--;
        if (_restTime <= 0) {
          _handleCleanTimer();
          _isGetCode = false;
          _restTime = 10;
        }
      });
    });
    setState(() {
      _isGetCode = true;
    });
  }

  _handleCleanTimer() {
    if (_myTimer != null) {
      _myTimer.cancel();
      _myTimer = null;
    }
  }

  List<Widget> _getLoginType(int loginType) {
    if (loginType == 0) {
      // 验证码登录
      return [
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 30),
          child: TextField(
            controller: _phonController,
            onChanged: (v) {
              setState(() {
                this._phone = v;
                this._disabled = !(v.length >= 11);
              });
            },
            inputFormatters: [
              // 长度限制
              LengthLimitingTextInputFormatter(11),
              // 数字限制
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                suffixIcon: this._phone.length > 0
                    ? IconButton(
                        icon: Image.asset('assets/icon/circle-cancel.png'),
                        onPressed: () {
                          setState(() {
                            this._phone = '';
                          });
                          onCancel(this._phonController);
                        },
                      )
                    : null,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black54,
                        style: BorderStyle.solid)), //获取焦点时，下划线的样式
                hintText: '手机号'),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: style.lightGrey, width: 1.0))),
          child: Row(children: [
            Expanded(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 45,
                    ),
                    child: TextField(
                      controller: _smscodeController,
                      onChanged: (v) {
                        setState(() {
                          _smsCode = v;
                          this._disabled =
                              !(_phone.length >= 11 && v.isNotEmpty);
                        });
                      },
                      inputFormatters: [
                        // 长度限制
                        LengthLimitingTextInputFormatter(6),
                        // 数字限制
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: this._smsCode.isNotEmpty
                              ? IconButton(
                                  icon: Image.asset(
                                      'assets/icon/circle-cancel.png'),
                                  onPressed: () {
                                    setState(() {
                                      _smsCode = '';
                                    });
                                    onCancel(this._smscodeController);
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          hintText: '验证码'),
                    )),
                flex: 1),
            GestureDetector(
              onTap: _handleGetCode,
              child: Container(
                width: 90,
                padding: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: style.lightGrey, width: 0.5))),
                child: Text(_isGetCode ? '$_restTime s' : '获取验证码',
                    style: style.mFontStyle.copyWith(color: style.themeColor)),
              ),
            )
          ]),
        ),
      ];
    }
    // 密码登录部分
    return [
      Container(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
        child: TextField(
          controller: this._usernameController,
          onChanged: (v) {
            setState(() {
              this._username = v;
              this._disabled = !(v.length > 0 && this._password.length > 0);
            });
          },
          style: TextStyle(fontSize: 16.0, color: Colors.black),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              suffixIcon: this._username.length > 0
                  ? IconButton(
                      icon: Image.asset('assets/icon/circle-cancel.png'),
                      onPressed: () {
                        setState(() {
                          this._username = '';
                        });
                        onCancel(this._usernameController);
                      },
                    )
                  : null,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black54,
                      style: BorderStyle.solid)), //获取焦点时，下划线的样式
              hintText: '请输入用户名/邮箱/手机号码'),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 30),
        child: TextField(
          controller: this._passwordController,
          onChanged: (v) {
            setState(() {
              this._password = v;
              this._disabled = !(v.length > 0 && this._username.length > 0);
            });
          },
          style: TextStyle(fontSize: 16.0, color: Colors.black),
          obscureText: this._isShow,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              suffixIcon: this._password.length > 0
                  ? IconButton(
                      icon: Image.asset('assets/icon/circle-cancel.png'),
                      onPressed: () {
                        setState(() {
                          _disabled = true;
                          _password = '';
                        });
                        onCancel(this._passwordController);
                      },
                    )
                  : null,
              prefixIcon: Container(
                width: 20,
                height: 20,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      this._isShow = !this._isShow;
                    });
                  },
                  child: Image.asset(
                    this._isShow
                        ? "assets/icon/eye-close.png"
                        : "assets/icon/eye-open.png",
                  ),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black54,
                      style: BorderStyle.solid)), //获取焦点时，下划线的样式
              hintText: '请输入密码'),
        ),
      ),
    ];
  }

  _handleLogin(int loginType) {
    // 0 免密登录 1 密码登录
    setState(() {
      this._disabled = true;
    });
    Map params = {};
    if (loginType == 0) {
      // 0 登录验证码 1 注册验证码
    } else {
      params = {
        'username': this._username,
        'password': this._password,
        'grant_type': 'password',
      };
    }
    setState(() {
      this._disabled = false;
    });
    UserAction.toLogin(loginType, params);
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        // resizeToAvoidBottomPadding: false, //解决键盘遮挡问题
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, style.topPadding + 5, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: 16.0,
                      height: 16.0,
                      alignment: Alignment.center,
                      child: Image.asset("assets/icon/arrow-left-black.png"),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        this._loginType = _loginType == 0 ? 1 : 0;
                      });
                    },
                    child: Text(
                      this._loginType == 0 ? '密码登录' : '免密登录',
                      style: style.baseFontStyle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                        child: ListTile(
                            title:
                                Text(this._loginType == 0 ? '手机免密登录' : '密码登录',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: style.baseFontColor,
                                      fontSize: style.bigFontSize,
                                    )),
                            subtitle: Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Text('欢迎登录',
                                  style: style.baseFontStyle
                                      .copyWith(color: style.secondFontColor)),
                            ))),
                    Column(
                      children: this._getLoginType(this._loginType),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(45, 30, 45, 20),
                        child: InkWell(
                          onTap: this._disabled
                              ? null
                              : () => this._handleLogin(this._loginType),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                              color: this._disabled
                                  ? Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.5)
                                  : Theme.of(context).accentColor,
                              gradient: style.baseGradient,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '登 录',
                                  style: style.mFontStyle
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                )),
            // Column(
            //   children: <Widget>[
            //     ListTile(
            //       title: Text('其他登录方式'),
            //     ),
            //     Row(
            //       ,
            //       children: <Widget>[
            //         SizedBox(
            //           width: 20.0,
            //         ),
            //         InkWell(
            //           child: Column(
            //             ,
            //             children: <Widget>[
            //               Container(
            //                 width: 28.0,
            //                 height: 28.0,
            //                 child: Image.asset("assets/icon/QQ.png"),
            //               ),
            //               Text(
            //                 'QQ',
            //                 style:
            //                     TextStyle(fontSize: 12.0, color: Colors.grey),
            //               )
            //             ],
            //           ),
            //         ),
            //         SizedBox(
            //           width: 20.0,
            //         ),
            //         InkWell(
            //           child: Column(
            //             ,
            //             children: <Widget>[
            //               Container(
            //                 width: 28.0,
            //                 height: 28.0,
            //                 child: Image.asset("assets/icon/wechat.png"),
            //               ),
            //               Text(
            //                 '微信',
            //                 style:
            //                     TextStyle(fontSize: 12.0, color: Colors.grey),
            //               )
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //     SizedBox(
            //       height: 10.0,
            //     ),
            //   ],
            // ),
            Container(
              padding: EdgeInsets.only(top: 5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/SelectSchool');
                },
                child: Column(
                  children: <Widget>[
                    Text(
                      this._schoolData['name'] ?? '',
                      style: TextStyle(
                          color: style.sFontColor, fontSize: style.titleSize),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      size: 30,
                      color: style.themeColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
