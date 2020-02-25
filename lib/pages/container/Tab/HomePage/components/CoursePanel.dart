import 'package:educationapp/model/CourseM.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CoursePanel extends StatefulWidget {
  final CourseM course;
  CoursePanel({this.course, Key key}) : super(key: key);
  @override
  _CoursePanelState createState() {
    return _CoursePanelState();
  }
}

class _CoursePanelState extends State<CoursePanel> {
  CourseM _course;
  @override
  void initState() {
    super.initState();
    _course = widget.course;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12, //阴影颜色
            blurRadius: 5.0, //阴影大小
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right:10),
            width: (style.width - 2 * (10 + 15)) * 0.33,
            height: (style.width - 2 * (10 + 15)) * 0.33,
            decoration: BoxDecoration(
                border: Border.all(
              width: 1.0,
              color: Color.fromRGBO(112, 112, 112, 1),
            )),
            child: Image.network(
              _course.courseImg,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Container(
                width: (style.width - 2 * (10 + 15)) * 0.53,
                height: (style.width - 2 * (10 + 15)) * 0.33,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _course.courseName,
                          style: style.mFontStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          _course.courseInfo,
                          style: style.baseFontStyle
                              .copyWith(color: style.secondFontColor),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/CourseDetails',
                            arguments: {
                              'courseId': _course.courseId,
                              'course': _course
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('了解更多',
                              style: style.baseFontStyle
                                  .copyWith(color: Colors.blue)),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset('assets/icon/arrow-right-blue.png'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              flex: 1),
        ],
      ),
    );
  }
}
