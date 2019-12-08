import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:educationapp/store/action/userAction.dart';

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
  bool _isShow = false; //密码是否可见
  String _password = '';
  String _username = '';
  bool _disabled = true;
  List<Widget> _getLoginType(int loginType) {
    if (loginType == 0) {
      return [
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 30),
          child: TextField(
            onChanged: (v) {
              setState(() {
                this._phone = v;
                this._disabled = !(v.length >= 11);
              });
            },
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black54,
                        style: BorderStyle.solid)), //获取焦点时，下划线的样式
                hintText: '请输入手机号码'),
          ),
        ),
      ];
    }
    return [
      Container(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
        child: TextField(
          onChanged: (v) {
            setState(() {
              this._username = v;
              this._disabled = !(v.length > 0 && this._password.length > 0);
            });
          },
          style: TextStyle(fontSize: 16.0, color: Colors.black),
          decoration: InputDecoration(
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
          onChanged: (v) {
            setState(() {
              this._password = v;
              this._disabled = !(v.length > 0 && this._username.length > 0);
            });
          },
          style: TextStyle(fontSize: 16.0, color: Colors.black),
          obscureText: this._isShow,
          decoration: InputDecoration(
              icon: Container(
                width: 20,
                height: 20,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      this._isShow = !this._isShow;
                    });
                  },
                  child: Image.asset(this._isShow
                      ? "assets/icon/eye-close.png"
                      : "assets/icon/eye-open.png"),
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
      Navigator.pushNamed(
          // 0 登录验证码 1 注册验证码
          context,
          "/SMSCode",
          arguments: {"type": 0, "phone": this._phone});
    } else {
      params = {
        'username': this._username,
        'password': this._password,
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
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: 16.0,
                          height: 16.0,
                          alignment: Alignment.center,
                          child:
                              Image.asset("assets/icon/arrow-left-black.png"),
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
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  Container(
                      child: ListTile(
                          title: Text(this._loginType == 0 ? '手机免密登录' : '密码登录',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20.0,
                              )),
                          subtitle: Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Text('欢迎登录',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14.0)),
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
                                ? Theme.of(context).accentColor.withOpacity(0.5)
                                : Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                this._loginType == 0 ? '获取验证码' : '登 录',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text('其他登录方式'),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 28.0,
                              height: 28.0,
                              child: Image.asset("assets/icon/QQ.png"),
                            ),
                            Text(
                              'QQ',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 28.0,
                              height: 28.0,
                              child: Image.asset("assets/icon/wechat.png"),
                            ),
                            Text(
                              '微信',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
