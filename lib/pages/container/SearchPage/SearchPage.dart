import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/provider/CourseListProvider.dart';
import 'package:educationapp/provider/UserProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CollectionItem.dart';
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
  List<String> _history = [];
  List<CourseM> _searchRes = [];
  bool _isSearch = true; //判断现在是否为搜索状态 or 结果状态
  String _from; //来源 0 来自课程列表 1 来自收藏夹
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String _oldKeywords = '';

  @override
  void initState() {
    super.initState();
    // _focusNode.addListener(() {
    //   bool focus = _focusNode.hasFocus;
    //   if (!focus) {
    //     this.setState(() {
    //       _searchRes = [];
    //     });
    //   }
    // });
    _initData();
  }

  _initData() async {
    _from = widget.arguments['from'];
    _oldKeywords = widget.arguments['keywords'] ?? '';
    _controller.text = _oldKeywords;
    List res = await _getHistoryWords();
    setState(() {
      _history = res[0] ?? [];
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _renderHistory() {
    return _history.map((item) {
      return InkWell(
          onTap: () {
            if (_from == '0') {
              _handleSearchCourse(item);
            } else {
              _handleOnSearch(item);
            }
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
            decoration: BoxDecoration(
              color: Color.fromRGBO(232, 232, 232, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(item, style: style.baseFontStyle),
          ));
    }).toList();
  }

  Widget _renderEmpty() {
    return Column(children: [
      Container(
        width:150,
        margin:EdgeInsets.fromLTRB(0, 50, 0, 15),
        child:Image.asset('assets/icon/icon-none.png',fit:BoxFit.fitWidth)
      ),
      Text('查找不到结果',style:style.mFontStyle)]);
  }

  Widget _renderResult() {
    return _searchRes.isEmpty
        ? _renderEmpty()
        : Expanded(
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
          );
  }

  Widget _renderSearchPanel() {
    return Expanded(
        flex: 1,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              if (_history.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('历史搜索',
                        style: style.baseFontStyle
                            .copyWith(fontSize: style.mFontSize)),
                    InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                      title: Text('确认删除历史吗?'),
                                      actions: [
                                        FlatButton(
                                          onPressed: () async {
                                            List res = await _getHistoryWords();
                                            SharedPreferences preferences =
                                                res[1];
                                            preferences.setStringList(
                                                _from == '0'
                                                    ? 'courseList'
                                                    : 'collection',
                                                []);
                                            setState(() {
                                              _history = [];
                                            });
                                            Navigator.pop(_);
                                          },
                                          child: Text('确定',
                                              style: style.mFontStyle.copyWith(
                                                  color: Colors.blue)),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(_);
                                          },
                                          child: Text('取消',
                                              style: style.mFontStyle.copyWith(
                                                  color: Colors.blue)),
                                        ),
                                      ]));
                        },
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
              Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: this._renderHistory(),
                ),
              ),
            ])));
  }

  Future _getHistoryWords() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> historyWord = _from == '0'
        ? preferences.getStringList('courseList')
        : preferences.getStringList('collection');
    return Future.value([historyWord, preferences]);
  }

  _handleOnSearch(String keywords) {
    _controller.text = '';
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
    if (keywords.isNotEmpty) {
      List<CourseM> searchRes = user.searchForCollection(keywords);
      setState(() {
        _searchRes = searchRes;
        _isSearch = false;
      });
    }
    _focusNode.unfocus();
  }

  _handleSearchCourse(String keywords) {
    _controller.text = '';
    CourseListProvider course =
        Provider.of<CourseListProvider>(context, listen: false);
    List<CourseM> searchRes = course.searchForCourse(keywords);
    navigatorKey.currentState.pushNamed('/CourseList',
        arguments: {'courseList': searchRes, 'keywords': keywords});
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
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
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 20),
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
                            onEditingComplete: () async {
                              String keywords = _controller.text;
                              List res = await _getHistoryWords();
                              List<String> historyWord = res[0] ?? [];
                              SharedPreferences preferences = res[1];
                              if (keywords.isNotEmpty &&
                                  !historyWord.contains(keywords)) {
                                setState(() {
                                  _history = [...historyWord, keywords];
                                  preferences.setStringList(
                                      _from == '0'
                                          ? 'courseList'
                                          : 'collection',
                                      _history);
                                });
                              }
                              if (_from == '1') {
                                _handleOnSearch(_controller.text);
                              } else {
                                _handleSearchCourse(_controller.text);
                              }
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
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text('取消',
                        style: TextStyle(
                            color: style.lightGrey, fontSize: style.mFontSize)),
                  ),
                ),
              ],
            ),
            if (_isSearch)
              _renderSearchPanel()
            else if (_from == '1')
              _renderResult()
          ]),
        ),
      ),
    );
  }
}
