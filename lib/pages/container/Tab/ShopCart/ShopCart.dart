import 'package:educationapp/model/Course.dart';
import 'package:educationapp/pages/container/Tab/ShopCart/component/ShopCartItem.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'component/NavBar.dart';
import 'const.dart';

class ShopCart extends StatefulWidget {
  @override
  _ShopCartState createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  int _num = 0;
  bool _status = true; //true 管理 false 完成
  bool _selectAll = false;
  List _selected = [];
  List _shopCartList = [];
  double _opacity = 0;
  double labelHeight = style.topPadding + 60;
  double decorationHeight = style.height / 8;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _shopCartList = courseData;
    _num = _shopCartList.length;
    double o;
    _scrollController.addListener(() {
      o = _scrollController.offset / labelHeight;
      setState(() {
        _opacity = o >= 1 ? 1 : o;
      });
    });
  }

  _handleOnManage() {
    setState(() {
      _status = !_status;
    });
  }

  Widget _renderBottom() {
    List<Widget> bottomList = [
      Expanded(
          child: InkWell(
              onTap: () {
                setState(() {
                  // 原本已经全选
                  if (_selectAll) {
                    _selected = [];
                  } else {
                    _selected = _shopCartList.map((item) {
                      Course course = Course.fromJson(item);
                      return course.courseId;
                    }).toList();
                  }
                  _selectAll = !_selectAll;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                          width: 18,
                          height: 18,
                          child: Image.asset(
                            _selectAll
                                ? "assets/icon/collect-select.png"
                                : "assets/icon/collect-unselect.png",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(width: 10.0),
                      Text('全选', style: style.mFontStyle)
                    ],
                  ))),
          flex: 1),
    ];
    if (_status) {
      bottomList = [
        ...bottomList,
        Text('合计：', style: style.baseFontStyle),
        Text(
          '¥50.00',
          style: style.baseFontStyle.copyWith(color: style.redColor),
        ),
        GestureDetector(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                    gradient: style.baseGradient,
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  '结算(${_selected.length})',
                  style: style.mFontStyle.copyWith(color: Colors.white),
                )))
      ];
    } else {
      bottomList = [
        ...bottomList,
        GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: style.orangeColor, width: 1.0),
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                child: Text(
                  '移入收藏夹',
                  style: style.mFontStyle.copyWith(color: style.orangeColor),
                ))),
        GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: style.redColor, width: 1.0),
                    color: Colors.white),
                child: Text(
                  '删除',
                  style: style.mFontStyle.copyWith(color: style.redColor),
                ))),
      ];
    }
    return Container(
      width: style.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: style.borderColor, width: 1)),
      child: Row(
        children: bottomList,
      ),
    );
  }

  List<Widget> _renderComponent() {
    return _shopCartList.map((item) {
      Course course = Course.fromJson(item);
      return GestureDetector(
        onTap: () {
          setState(() {
            if (_selected.contains(course.courseId)) {
              _selected.removeWhere((ele) => ele == course.courseId);
            } else {
              _selected.add(course.courseId);
            }
          });
        },
        child: ShopCartItem(
            item: course, isSelected: _selected.contains(course.courseId)),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          backgroundColor: style.grey,
          body: Column(children: [
            Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: style.width,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Stack(children: [
                          Column(children: [
                            Container(
                              height: _shopCartList.isEmpty
                                  ? labelHeight
                                  : labelHeight + decorationHeight,
                              padding: EdgeInsets.fromLTRB(
                                  10, style.topPadding, 10, 0),
                              decoration: BoxDecoration(
                                  gradient: style.lightGradient,
                                  color: style.themeColor),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('购物车',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22)),
                                        GestureDetector(
                                          onTap: _handleOnManage,
                                          child: Container(
                                              width: 40,
                                              alignment: Alignment.centerRight,
                                              child: Text(_status ? '管理' : '完成',
                                                  style: style.mFontStyle
                                                      .copyWith(
                                                          color:
                                                              Colors.white,fontSize: style.titleSize))),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text('共$_num件宝贝',
                                        style: style.baseFontStyle
                                            .copyWith(color: Colors.white)),
                                  ]),
                            ),
                            if (_shopCartList.isEmpty)
                              Container(
                                height: style.height - 200,
                                width: style.width,
                                color: style.grey,
                                child: Center(child: Text('购物车是空的，去添加些课程吧')),
                              ),
                          ]),
                          Container(
                              padding: EdgeInsets.only(top: labelHeight),
                              child: Column(
                                children: _renderComponent(),
                              ))
                        ]),
                      ),
                    ),
                    if (_opacity > 0)
                      Opacity(
                        opacity: _opacity,
                        child: NavBar(
                          title: '购物车($_num)',
                          status: _status,
                          handleOnManage: _handleOnManage,
                        ),
                      ),
                  ],
                ),
                flex: 1),
            _renderBottom()
          ])),
    );
  }
}
