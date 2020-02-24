import 'package:educationapp/model/Course.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'component/const.dart';
import 'component/CollectionItem.dart';
import 'package:educationapp/pages/components/BaseButton.dart';

class Collection extends StatefulWidget {
  @override
  State<Collection> createState() {
    return _CollectionState();
  }
}

class _CollectionState extends State<Collection> {
  bool _status = false; //false 管理 true 完成
  List _collectionList = [];
  List _selected = [];
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    _collectionList = courseData;
  }

  Widget _renderRight() {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      InkWell(
          onTap: () {
            navigatorKey.currentState.pushNamed('/CollectionSearch');
          },
          child: Container(
              width: 18,
              height: 18,
              child: Image.asset(
                'assets/icon/collect-search.png',
                fit: BoxFit.contain,
              ))),
      SizedBox(width: 10),
      InkWell(
          onTap: () {
            this.setState(() {
              _status = !_status;
              _selected = [];
            });
          },
          child: Text(_status ? '完成' : '管理',
              style: style.baseFontStyle.copyWith(fontSize: style.titleSize)))
    ]);
  }

  List<Widget> _renderComponents() {
    return _collectionList.map((item) {
      Course course = Course.fromJson(item);
      return InkWell(
          onTap: () => this._handleOnTap(course.courseId),
          child: CollectionItem(
            item: course,
            onCancel: _handleOnCancel,
            status: _status,
            isSelected: _selected.contains(course.courseId),
          ));
    }).toList();
  }

  _handleOnTap(String id) {
    if (_status) {
      this.setState(() {
        if (_selected.contains(id)) {
          _selected.remove(id);
        } else {
          _selected.add(id);
        }
        if (_selected.length == _collectionList.length) {
          _selectAll = true;
        }
      });
    } else {
      navigatorKey.currentState
          .pushNamed('/CourseDetails', arguments: {'courseId': id});
    }
  }

  _handleOnCancel() {
    showModalBottomSheet(
        context: context,
        builder: (_) => Stack(children: <Widget>[
              Container(
                height: 15,
                width: style.width,
                color: Colors.black54,
              ),
              Container(
                  width: style.width,
                  height: 105.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(children: <Widget>[
                    BaseButton(
                      title: '取消收藏',
                      onTap: () {},
                      prefix: 'assets/icon/collection-heart.png',
                    ),
                    Container(width: style.width, height: 5, color: style.grey),
                    BaseButton(
                      title: '取消',
                      onTap: () {
                        Navigator.pop(_);
                      },
                    ),
                  ])),
            ]));
  }

  Widget _renderBottom() {
    return Container(
      width: style.width,
      color: style.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              onTap: () {
                this.setState(() {
                  if (_selectAll) {
                    _selected = [];
                  } else {
                    _selected = _collectionList.map((ele) {
                      Course course = Course.fromJson(ele);
                      return course.courseId;
                    }).toList();
                  }
                  _selectAll = !_selectAll;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
          GestureDetector(
            onTap: () {
              List resCollectionList = _collectionList.where((ele) {
                Course course = Course.fromJson(ele);
                return !_selected.contains(course.courseId);
              }).toList();
              setState(() {
                _collectionList = resCollectionList;
              });
              Fluttertoast.showToast(
                  msg: '取消收藏成功', gravity: ToastGravity.CENTER);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  color: style.themeColor,
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: style.baseGradient),
              child: Text('全部删除',
                  style: TextStyle(
                      color: Colors.white, fontSize: style.mFontSize)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
      title: '收藏夹',
      backgroundColor: Colors.white,
      right: _renderRight(),
      rightDistance: 65,
      components: _renderComponents(),
      bottom: _status ? _renderBottom() : null,
    );
  }
}
