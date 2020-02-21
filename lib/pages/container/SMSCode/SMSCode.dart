import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

var themeColor = Color.fromRGBO(37, 102, 177, 1);

class SMSCode extends StatefulWidget {
  final arguments;
  SMSCode({this.arguments, Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SMSCodeState(arguments: arguments);
  }
}

class _SMSCodeState extends State<SMSCode> {
  var _arguments;
  var _time = 60;
  _SMSCodeState({arguments}) {
    this._arguments = arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('输入验证码',
                    style:
                        TextStyle(fontSize: style.bigFontSize, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "已将验证码发送至手机号:${this._arguments['phone']}",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
