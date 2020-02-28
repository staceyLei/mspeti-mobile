import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/provider/CourseListProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:provider/provider.dart';
import 'component/const.dart';
import 'component/ClassifyBtn.dart';
import 'component/CourseItem.dart';

class CourseList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CourseListState();
  }
}

class _CourseListState extends State<CourseList> {
  String _selected = "all";
  // List<Map> _courseData;
  List<CourseM> _courseData;
  bool _layout = false; // false为行列 true为纵列布局

  @override
  void initState() {
    super.initState();
    // this._courseData = courseData ?? [];
  }

  List<Widget> _renderTopBtn() {
    return (btnData ?? []).map((item) {
      return ClassifyBtn(
        isActive: item['key'] == _selected,
        onTap: () {
          this.setState(() {
            _selected = item['key'];
          });
        },
        title: item['value'],
      );
    }).toList();
  }

  List<Widget> _renderList() {
    return _courseData.map((item) {
      // CourseM course = CourseM.fromJson(item);
      return CourseItem(
        // item: course,
        item:item,
        layout: _layout,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          backgroundColor: _layout ? style.grey : Colors.white,
          body: Consumer<CourseListProvider>(
            builder: (context, course, _) {
              _courseData = course.courseList;
              return Column(children: <Widget>[
                Container(
                  width: style.width,
                  padding:
                      EdgeInsets.fromLTRB(15, style.topPadding + 5, 15, 10),
                  color: Colors.white,
                  child: Row(children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          "assets/icon/arrow-left-grey.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap: () {
                            navigatorKey.currentState.pushNamed('/SearchPage',
                                arguments: {'from': 'courseList'});
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            decoration: BoxDecoration(
                              color: style.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 16,
                                  height: 16,
                                  child: Image.asset(
                                      'assets/icon/course-search.png',
                                      fit: BoxFit.contain),
                                ),
                                SizedBox(width: 10),
                                Text('搜索课程',
                                    style: style.hintStyle
                                        .copyWith(fontSize: style.mFontSize)),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        this.setState(() {
                          _layout = !_layout;
                        });
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          _layout
                              ? "assets/icon/switch-layout.png"
                              : "assets/icon/switch-row.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                    width: style.width,
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(color: style.grey, width: 0.5),
                        )),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: this._renderTopBtn(),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: this._renderList(),
                    ),
                  ),
                )
              ]);
            },
          )),
    );
  }
}
