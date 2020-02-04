import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'component/CollectionItem.dart';
import 'const.dart';

class CollectionSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionSearchState();
  }
}

class _CollectionSearchState extends State<CollectionSearch> {
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
          _searchRes = res;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: style.grey,
      body: Container(
        padding: EdgeInsets.only(top: style.topPadding + 10),
        child: Column(children: [
          // 搜索框
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 15),
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
                            controller: _controller,
                            focusNode: _focusNode,
                            style: style.mFontStyle,
                            autofocus: true,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 10),
                                prefixIcon: Container(
                                  width: 16,
                                  height: 16,
                                  padding: EdgeInsets.all(2.5),
                                  child: Image.asset(
                                      "assets/icon/course-search.png"),
                                ),
                                hintText: '搜索机构',
                                hintStyle: style.hintStyle
                                    .copyWith(fontSize: style.mFontSize),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ))),
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  navigatorKey.currentState.pop();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('取消',
                      style: TextStyle(
                          color: style.lightGrey, fontSize: style.mFontSize)),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 15),
                  itemCount: _searchRes.length,
                  itemBuilder: (context, index) {
                    return CollectionItem(
                      item: _searchRes[index],
                    );
                  }),
            ),
          )
        ]),
      ),
    );
  }
}
