import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'const.dart';

class SearchPage extends StatefulWidget {
  final arguments;
  SearchPage({this.arguments});
  @override
  State<SearchPage> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  List _history = [];
  List _searchRes = [];
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      bool focus = _focusNode.hasFocus;
      if (!focus) {
        this.setState(() {
          _searchRes = [];
        });
      }
    });
  }

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
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 20.0,
                      ),
                      child: TextField(
                          textInputAction: TextInputAction.search,
                          controller: _controller,
                          focusNode: _focusNode,
                          style: style.mFontStyle,
                          autofocus: true,
                          onEditingComplete: () {
                            print('wancheng');
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              prefixIcon: Container(
                                width: 16,
                                height: 16,
                                padding: EdgeInsets.all(2.5),
                                child: Image.asset(
                                    "assets/icon/course-search.png"),
                              ),
                              hintText: '搜索课程',
                              hintStyle: style.hintStyle
                                  .copyWith(fontSize: style.mFontSize),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ))),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState.pop();
                },
                child: Container(
                  padding: EdgeInsets.only(left: 15.0),
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
