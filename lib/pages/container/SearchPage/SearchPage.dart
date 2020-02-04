import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'const.dart';

class SearchPage extends StatelessWidget {
  List _history = [];

  List<Widget> _renderHistory() {
    _history = history;
    return _history.map((item) {
      return InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(232, 232, 232, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(item, style: style.baseFontStyle),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: style.grey,
      body: Container(
        padding: EdgeInsets.fromLTRB(15, style.topPadding + 10, 15, 0),
        child: Column(children: [
          // 搜索框
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        navigatorKey.currentState
                            .pushReplacementNamed('/CollectionSearch');
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(children: [
                          Container(
                            width: 16,
                            height: 16,
                            child: Image.asset('assets/icon/course-search.png',
                                fit: BoxFit.contain),
                          ),
                          SizedBox(width: 10),
                          Text('搜索',
                              style: style.hintStyle
                                  .copyWith(fontSize: style.mFontSize)),
                        ]),
                      ))),
              InkWell(
                onTap: () {
                  navigatorKey.currentState.pop();
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('取消',
                      style: TextStyle(
                          color: style.lightGrey, fontSize: style.mFontSize)),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('历史搜索',
                  style:
                      style.baseFontStyle.copyWith(fontSize: style.mFontSize)),
              InkWell(
                  onTap: () {},
                  child: Container(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      "assets/icon/icon-dustbin.png",
                      fit: BoxFit.contain,
                    ),
                  )),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.topLeft,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: this._renderHistory(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
