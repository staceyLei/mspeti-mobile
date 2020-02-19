import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'package:educationapp/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'const.dart';

class SelectSchool extends StatefulWidget {
  @override
  State<SelectSchool> createState() {
    return _SelectSchoolState();
  }
}

class _SelectSchoolState extends State<SelectSchool> {
  List<Map<String, String>> arr;
  bool _status = true; //true为展示状态；false为搜索状态
  TextEditingController _controller = TextEditingController();
  bool _isAutoFocus = true; //一开始时跳转到搜索页自动获焦
  FocusNode _focusNode = FocusNode();
  SharedPreferences _prefs;
  List<Map<String, String>> _searchRes;
  @override
  void initState() {
    super.initState();
    arr = schoolData;
    // 监听失去焦点事件，失去焦点时候搜索
    _focusNode.addListener(() {
      bool hasFocus = _focusNode.hasFocus;
      if (!hasFocus && !_status) {
        _searchData();
      }
    });
  }

  void _searchData() {
    print('search data:${_controller.text}');
    this.setState(() {
      _searchRes = arr;
    });
  }

  Widget renderList(List data) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: data.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () async {
              _prefs = await SharedPreferences.getInstance();
              _prefs.setString('schoolName', data[index]['name']);
              _prefs.setString('schoolId', data[index]['id']);
              _focusNode.unfocus();
              navigatorKey.currentState.pushNamed('/Login');
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border(
                bottom: BorderSide(color: style.borderColor, width: 1.0),
              )),
              child: Text(data[index]['name'],
                  style: style.mFontStyle),
            ));
      },
    );
  }

// 展示列表状态
  Widget renderShow() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: style.topPadding,
        ),
        Container(
          child: Text('选择机构',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: style.titleSize,
                color: style.baseFontColor,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration:
              BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[]),
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: style.bgGrey,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 20.0,
                ),
                child: InkWell(
                  onTap: () {
                    this.setState(() {
                      this._status = false;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 16,
                        height: 16,
                        child: Image.asset(
                          "assets/icon/search.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text("搜索机构", style: style.hintStyle.copyWith(fontSize:style.mFontSize)),
                    ],
                  ),
                ),
              )),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: style.bgColor,
            child: this.renderList(this.arr),
          ),
        )
      ],
    );
  }

// 搜索列表状态
  Widget renderSearch() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: style.topPadding,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: style.bgGrey,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 20.0,
                      ),
                      child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              prefixIcon: Container(
                                width: 16,
                                height: 16,
                                padding: EdgeInsets.all(2.5),
                                child: Image.asset("assets/icon/search.png"),
                              ),
                              hintText: '搜索机构',
                              hintStyle: style.hintStyle,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ))),
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                this.setState(() {
                  this._status = true;
                  _isAutoFocus = true;
                  _searchRes = [];
                });
                _controller.text = '';
                _focusNode.unfocus();
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text('取消', style: TextStyle(color: Colors.green)),
              ),
            )
          ],
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              _focusNode.unfocus();
            },
            child: Container(
              color: style.bgColor,
              child: this.renderList(_searchRes ?? []),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_status && _isAutoFocus) {
      // 切换页面之后跳转到搜索页时获取焦点
      this.setState(() {
        _isAutoFocus = false;
      });
      FocusScope.of(context).requestFocus(_focusNode);
    }
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: this._status ? this.renderShow() : this.renderSearch(),
    );
  }
}
