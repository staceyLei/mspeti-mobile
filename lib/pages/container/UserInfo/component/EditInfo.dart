import 'dart:async';

import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditInfo extends StatefulWidget {
  final arguments;
  EditInfo({this.arguments});
  @override
  State<EditInfo> createState() {
    return _EditInfoState(arguments: arguments);
  }
}

class _EditInfoState extends State<EditInfo> {
  final arguments;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  int _time = 10;
  Timer _timer;
  bool _isGetCode = false; //是否获取验证码
  int _status; //0 邮箱 1 手机号

  _EditInfoState({this.arguments}) {
    this._status = this.arguments['status'];
  }

  bool _isEmail(String email) {
    String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    if (email.isEmpty) return false;
    return RegExp(regexEmail).hasMatch(email);
  }

  bool _isPhone(String phone) {
    String regexEmail = "^1[3456789]\\d{9}\$";
    if (phone.isEmpty) return false;
    return RegExp(regexEmail).hasMatch(phone);
  }

// 清理定时器
  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  List<Widget> _renderComponents() {
    if (_status == 0) {
      return <Widget>[
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: style.borderColor, width: 1),
                bottom: BorderSide(color: style.borderColor, width: 1),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('邮箱', style: style.baseFontStyle),
              Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _emailController,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: style.hintStyle,
                        hintText: '请输入邮箱'),
                  )),
            ],
          ),
        )
      ];
    }
    return [
      SizedBox(height: 1),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: style.borderColor, width: 1),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('联系方式', style: style.baseFontStyle),
            Expanded(
                flex: 1,
                child: TextField(
                  controller: _phoneController,
                  enabled: !_isGetCode,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: style.hintStyle,
                      hintText: '请输入手机号码'),
                )),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: style.borderColor, width: 1),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('验证码', style: style.baseFontStyle),
            Expanded(
                flex: 1,
                child: TextField(
                  controller: _codeController,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: style.hintStyle,
                      hintText: '输入验证码'),
                )),
            SizedBox(width: 10.0),
            InkWell(
              onTap: () {
                if (!_isGetCode) {
                  bool isCorrect = _isPhone(_phoneController.text);
                  if (!isCorrect) {
                    Fluttertoast.showToast(
                        msg: '请输入正确的手机号码', gravity: ToastGravity.CENTER);
                    return;
                  }
                  this.setState(() {
                    _isGetCode = true;
                  });
                  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                    this.setState(() {
                      if (_time <= 1) {
                        _cancelTimer();
                        _isGetCode = false;
                        _time = 10;
                        return;
                      }
                      _time = _time - 1;
                    });
                  });
                }
              },
              child: Container(
                  height: 50.0,
                  alignment: Alignment(0, 0),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: style.borderColor, width: 1)),
                  ),
                  child: !_isGetCode
                      ? Text('获取验证码',
                          style: style.baseFontStyle
                              .copyWith(color: style.themeColor))
                      : Text('${_time}s后重新获取')),
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Text('绑定手机号码，更便于提供更好服务',
            style: style.baseFontStyle.copyWith(color: style.lightGrey)),
      )
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
      title: '修改信息',
      right: InkWell(
        onTap: () {
          bool isCorrect = _isEmail(_emailController.text);
          if (!isCorrect && _status == 0) {
            Fluttertoast.showToast(
                msg: '请输入正确的邮箱', gravity: ToastGravity.CENTER);
            return;
          }
          if(_status == 1){
            //校验验证码是否正确，号码不能为空！
          }
          Fluttertoast.showToast(msg: '修改成功', gravity: ToastGravity.CENTER);
          _timer.cancel();
          _timer = null;
          Navigator.pop(context);
        },
        child: Container(
          width: 25.0,
          child: Text('完成', style: style.baseFontStyle),
        ),
      ),
      components: _renderComponents(),
    );
  }
}
