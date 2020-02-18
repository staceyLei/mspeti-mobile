import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/BaseLayout.dart';
import 'component/const.dart';
import 'component/CommentItem.dart';

class Comment extends StatefulWidget {
  @override
  State<Comment> createState() {
    return _CommentState();
  }
}

class _CommentState extends State<Comment> {
  bool _isSend = true; //0 我发出的 1 我收到的
  List _sendData = [];
  List _receivedData = [];

  @override
  void initState() {
    super.initState();
    _sendData = sendData;
    _receivedData = receiveData;
  }

  Widget _renderEmpty() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 90,
        height: 90,
        child: Image.asset(
          'assets/icon/homework-none.png',
          fit: BoxFit.contain,
        ),
      ),
      Text('暂无点评',
          style: style.secondFontStyle
              .copyWith(fontSize: 20, color: style.lightGrey)),
    ]);
  }

  Widget _renderContent() {
    if (_isSend) {
      return _sendData.isEmpty
          ? _renderEmpty()
          : Column(
              children: _sendData.map((item) {
              return CommentItem(
                item: item,
                isSend: _isSend,
              );
            }).toList());
    } else {
      return _receivedData.isEmpty
          ? _renderEmpty()
          : Column(
              children: _receivedData.map((item) {
              return CommentItem(
                item: item,
                isSend: _isSend,
              );
            }).toList());
    }
  }

  Widget _renderNavBarB() {
    return Container(
      width: style.width,
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            blurRadius: 1,
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 2)),
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
              onTap: () {
                setState(() {
                  _isSend = true;
                });
              },
              child: Column(children: [
                Text('我发出的',
                    style: style.mFontStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            !_isSend ? style.lightGrey : style.baseFontColor)),
                if (_isSend)
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: 30,
                      height: 4,
                      decoration: BoxDecoration(
                          gradient: style.baseGradient,
                          borderRadius: BorderRadius.circular(2))),
              ])),
          SizedBox(width: 30),
          InkWell(
              onTap: () {
                setState(() {
                  _isSend = false;
                });
              },
              child: Column(children: [
                Text('我收到的',
                    style: style.mFontStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            _isSend ? style.lightGrey : style.baseFontColor)),
                if (!_isSend)
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: 30,
                      height: 4,
                      decoration: BoxDecoration(
                          gradient: style.baseGradient,
                          borderRadius: BorderRadius.circular(2))),
              ])),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: '我的点评',
        hasBorder: false,
        backgroundColor: Colors.white,
        navBarB: _renderNavBarB(),
        components: SingleChildScrollView(child: _renderContent()));
  }
}
