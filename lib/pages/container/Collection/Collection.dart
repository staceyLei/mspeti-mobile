import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/provider/UserProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
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
  List<String> _selected = [];
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    // _collectionList = courseData;
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

  List<Widget> _renderComponents(UserProvider user) {
    return _collectionList.map((course) {
      // CourseM course = CourseM.fromJson(item);
      return InkWell(
          onTap: () => this._handleOnTap(course),
          child: CollectionItem(
            item: course,
            onCancel: () => _handleOnCancel(user),
            status: _status,
            isSelected: _selected.contains(course.courseId),
          ));
    }).toList();
  }

  _handleOnTap(CourseM course) {
    if (_status) {
      this.setState(() {
        if (_selected.contains(course.courseId)) {
          _selected.remove(course.courseId);
        } else {
          _selected.add(course.courseId);
        }
        if (_selected.length == _collectionList.length) {
          _selectAll = true;
        } else if (_selectAll) {
          _selectAll = false;
        }
      });
    } else {
      navigatorKey.currentState.pushNamed('/CourseDetails',
          arguments: {'courseId': course.courseId, 'course': course});
    }
  }

  _handleOnCancel(UserProvider user) {
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
                      onTap: () {
                        user.removeFromCollect(_selected);
                      },
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

  Widget _renderBottom(UserProvider user) {
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
                      // CourseM course = CourseM.fromJson(ele);
                      return ele.courseId;
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
              // List resCollectionList = _collectionList.where((ele) {
              //   // CourseM course = CourseM.fromJson(ele);
              //   return !_selected.contains(ele.courseId);
              // }).toList();
              // setState(() {
              //   _collectionList = resCollectionList;
              // });
              // Fluttertoast.showToast(
              //     msg: '取消收藏成功', gravity: ToastGravity.CENTER);
              user.removeFromCollect(_selected);
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

  List<Widget> _renderEmpty() {
    return [
      Container(
        height: style.height - 200,
        width: style.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                margin: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/icon/collection-empty.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text('收藏夹是空的，去添加些吧~', style: style.mFontStyle)
            ]),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, _) {
        print('change');
        _collectionList = user.collection ?? [];
        return NavLayout(
          title: '收藏夹',
          backgroundColor: Colors.white,
          right: _renderRight(),
          rightDistance: 65,
          components: _collectionList.length == 0
              ? _renderEmpty()
              : _renderComponents(user),
          bottom: _status ? _renderBottom(user) : null,
        );
      },
    );
  }
}
