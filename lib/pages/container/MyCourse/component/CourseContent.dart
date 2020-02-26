import 'package:educationapp/pages/components/CourseArrangeTable.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/model/MyCourseM.dart';

class CourseContent extends StatelessWidget {
  final arguments;
  MyCourseM _item;
  double _percent;
  double _total;
  CourseContent({this.arguments}) {
    _item = arguments['item'];
    _total = style.width - 2 * 20 - 2 * 10 - 80;
    _percent = ((double.parse(_item.nowCourseHours) /
        double.parse(_item.courseHours)));
  }

  Widget _renderItem(String title, String hours) {
    return Column(children: [
      Text(title, style: style.baseFontStyle.copyWith(color: style.lightGrey)),
      SizedBox(height: 5),
      Row(
        children: <Widget>[
          Text(
            hours,
            style: TextStyle(
                color: style.themeColor,
                fontSize: style.titleSize,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 2),
          Text(
            '课时',
            style: style.sFontStyle.copyWith(color: style.baseFontColor),
          )
        ],
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
        title: '课程内容',
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(15),
        components: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(_item.courseImg,
                  width: 100, height: 100, fit: BoxFit.cover),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_item.courseName,
                          style: style.mFontStyle.copyWith(
                              fontSize: style.titleSize,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(_item.courseTeacher.teacherName,
                          style: style.mFontStyle),
                      SizedBox(height: 5),
                      Text(
                        '开始时间:${_item.beginTime}',
                        style: style.baseFontStyle.copyWith(
                            color: style.lightGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '结束时间:${_item.endTime}',
                        style: style.baseFontStyle.copyWith(
                            color: style.lightGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                flex: 1),
          ]),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _renderItem('已上', _item.nowCourseHours),
                      Container(width: 1, height: 12, color: style.lightGrey),
                      _renderItem(
                          '剩余',
                          (int.parse(_item.courseHours) -
                                  int.parse(_item.nowCourseHours))
                              .toString()),
                      Container(width: 1, height: 12, color: style.lightGrey),
                      _renderItem('已上', _item.courseHours),
                    ]),
                SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('课程进度',
                          style: style.baseFontStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            width: _total,
                            height: 1,
                            color: style.lightGrey,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 4,
                            width: _percent * _total,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                gradient: style.baseGradient),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Expanded(
                          child: Text('${(_percent * 100).toStringAsFixed(0)}%',
                              style: style.sFontStyle
                                  .copyWith(color: style.baseFontColor)),
                          flex: 1),
                    ]),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                onPressed: () {
                  navigatorKey.currentState
                      .pushNamed('/AddComment', arguments: {
                    'isTeacher': true,
                    'data': {
                      'teacher': _item.courseTeacher,
                      'course': _item.courseName,
                      'img': _item.courseTeacher.teacherImg
                    }
                  });
                },
                borderSide: BorderSide(color: style.orangeColor),
                highlightedBorderColor: style.orangeColor,
                child: Text(
                  '点评老师',
                  style: TextStyle(
                      color: style.orangeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: style.titleSize),
                ),
              ),
              SizedBox(width: 30),
              OutlineButton(
                onPressed: () {
                  navigatorKey.currentState
                      .pushNamed('/AddComment', arguments: {
                    'isTeacher': false,
                    'data': {
                      'teacher': _item.courseTeacher,
                      'course': _item.courseName,
                      'img': _item.courseImg
                    }
                  });
                },
                borderSide: BorderSide(color: style.greenColor),
                highlightedBorderColor: style.greenColor,
                child: Text(
                  '点评课程',
                  style: TextStyle(
                      color: style.greenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: style.titleSize),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text('课程安排',
              style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          CourseArrangeTable(_item.courseTime),
          SizedBox(height: 10),
        ]);
  }
}
