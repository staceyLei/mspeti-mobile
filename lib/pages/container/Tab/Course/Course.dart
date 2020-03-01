import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/pages/container/CourseList/CourseList.dart';
import 'package:educationapp/provider/CourseListProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:provider/provider.dart';
import 'component/const.dart';
import 'component/ClassifyBtn.dart';
import 'component/CourseItem.dart';

class Course extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CourseState();
  }
}

class _CourseState extends State<Course> {
  // List<Map> _courseData;
  List<CourseM> _courseData;
  List _classifyArr;
  String _selected;

  @override
  void initState() {
    super.initState();
    // this._courseData = courseData ?? [];
    _classifyArr = classify ?? [];
    _selected = _classifyArr[0]['key'];
  }

  List<Widget> _renderClassify() {
    return _classifyArr.map((item) {
      bool _isSelected = item['key'] == _selected;
      return InkWell(
        onTap: () {
          if (!_isSelected) {
            setState(() {
              _selected = item['key'];
            });
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: _isSelected ? style.blueBlack : style.borderColor,
              borderRadius: BorderRadius.circular(10)),
          child: Text(item['value'],
              style: style.mFontStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _isSelected ? Colors.white : style.baseFontColor)),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Consumer<CourseListProvider>(
          builder: (context, course, _) {
            _courseData = course.courseList;
            return Scaffold(
              endDrawer: Container(
                color: Colors.white,
                width: style.width * 0.5,
                child: Drawer(
                  child: Column(children: [
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                          child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(
                            15, style.topPadding + 10, 15, 0),
                        child: Wrap(
                          children: _renderClassify(),
                          spacing: 20,
                          runSpacing: 10,
                        ),
                      )),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          margin: EdgeInsets.only(bottom: 5),
                          width: style.width * 0.5 - 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: style.baseGradient),
                          alignment: Alignment.center,
                          child: Text('确定',
                              style: style.mFontStyle
                                  .copyWith(color: Colors.white)),
                        ))
                  ]),
                ),
              ),
              backgroundColor: Colors.white,
              body: Column(children: <Widget>[
                Container(
                  width: style.width,
                  padding:
                      EdgeInsets.fromLTRB(15, style.topPadding + 5, 15, 10),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: style.borderColor, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap: () {
                            navigatorKey.currentState.pushNamed('/SearchPage',
                                arguments: {'from': '0'});
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            decoration: BoxDecoration(
                              color: style.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('搜索课程', style: style.hintStyle),
                                Container(
                                  width: 16,
                                  height: 16,
                                  child: Image.asset(
                                      'assets/icon/course-search.png',
                                      fit: BoxFit.contain),
                                )
                              ],
                            ),
                          )),
                    ),
                    SizedBox(width: 10),
                    Builder(
                        builder: (_) => InkWell(
                            onTap: () {
                              Scaffold.of(_).openEndDrawer();
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: style.grey),
                              child: Text(
                                '分类',
                                style: TextStyle(
                                  fontSize: style.mFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: style.lightGrey,
                                ),
                              ),
                            )))
                  ]),
                ),
                Expanded(
                    flex: 1,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: _courseData.length,
                        itemBuilder: (context, index) {
                          // CourseM course = CourseM.fromJson(_courseData[index]);
                          // return CourseItem(item: course);
                          return CourseItem(item: _courseData[index]);
                        }))
              ]),
            );
          },
        ));
  }
}
