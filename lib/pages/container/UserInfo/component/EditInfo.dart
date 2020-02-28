import 'dart:async';

import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:educationapp/pages/components/BaseInput.dart';

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
  final TextEditingController _oldPwd = TextEditingController();
  final TextEditingController _newPwd = TextEditingController();
  int _time = 10;
  Timer _timer;
  bool _isGetCode = false; //是否获取验证码
  int _status; //0 邮箱 1 手机号 2密码
  Function _handleEdit;
  String _info; //修改前的旧信息

  _EditInfoState({this.arguments}) {
    _initData();
  }

  _initData() {
    _status = arguments['status'];
    _handleEdit = arguments['handleOnEdit'];
    _info = arguments['info'];
    if (_status == 0) {
      _emailController.text = _info;
    } else if (_status == 1) {
      _phoneController.text = _info;
    }
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
        BaseInput(
          title: '邮箱',
          hintText: '请输入邮箱',
          controller: _emailController,
        ),
      ];
    }
    return [
      SizedBox(height: 1),
      BaseInput(
        title: '联系方式',
        hintText: '请输入手机号码',
        controller: _phoneController,
        enabled: !_isGetCode,
        keyboardType: TextInputType.phone,
        formatters: [
          // 长度限制
          LengthLimitingTextInputFormatter(11),
          // 数字限制
          WhitelistingTextInputFormatter.digitsOnly,
        ],
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: style.borderColor, width: 1),
            )),
        child: Row(
          children: <Widget>[
            Text('验证码', style: style.mFontStyle),
            Expanded(
                flex: 1,
                child: TextField(
                  controller: _codeController,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      hintStyle:
                          style.hintStyle.copyWith(fontSize: style.mFontSize),
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
                  width: 85,
                  alignment: Alignment(0, 0),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: style.borderColor, width: 1)),
                  ),
                  child: Text(!_isGetCode ? '获取验证码' : '${_time}s',
                      style:
                          style.mFontStyle.copyWith(color: style.themeColor))),
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

  List<Widget> _renderPassword() {
    return [
      BaseInput(
        title: '原密码',
        hintText: '请输入原密码',
        controller: _oldPwd,
      ),
      BaseInput(
        title: '新密码',
        hintText: '请输入新密码',
        controller: _newPwd,
      )
    ];
  }

  _handleComplete(int status, bool isCorrect) {
    List<String> tips = ['请输入正确的邮箱地址', '验证码不正确', '新旧密码不一致'];
    List<String> editInfo = [
      _emailController.text,
      _phoneController.text,
      _newPwd.text
    ];
    if (isCorrect) {
      _handleEdit(editInfo[status]);
      print('status:$status --- ${editInfo[status]}');
      Fluttertoast.showToast(msg: '修改成功', gravity: ToastGravity.CENTER);
      navigatorKey.currentState.pop();
    } else {
      Fluttertoast.showToast(msg: tips[status], gravity: ToastGravity.CENTER);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
      backgroundColor: style.grey,
      title: '修改信息',
      right: InkWell(
        onTap: () {
          bool isCorrect = false;
          if (_status == 0) {
            isCorrect = _isEmail(_emailController.text);
          } else if (_status == 1) {
            //校验验证码是否正确，号码不能为空！
            isCorrect = _isPhone(_phoneController.text);
          }
          _handleComplete(_status, isCorrect);
        },
        child: Container(
          width: 30.0,
          child: Text('完成', style: style.mFontStyle),
        ),
      ),
      components: _status == 2 ? _renderPassword() : _renderComponents(),
    );
  }
}
