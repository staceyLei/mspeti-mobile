import 'package:educationapp/model/MyCourseM.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/components/NavLayout.dart';
import 'component/CourseItem.dart';
import 'component/const.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  List _courseData;
  @override
  void initState() {
    super.initState();
    _courseData = courseData ?? [];
  }

  List<Widget> _renderComponents() {
    return _courseData.map((item) {
      MyCourseM course = MyCourseM.fromJson(item);
      return InkWell(
          onTap: () {
            navigatorKey.currentState
                .pushNamed('/CourseContent', arguments: {'item': course});
          },
          child: CourseItem(item: course));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
        backgroundColor: Colors.white,
        title: '我的课程',
        padding: EdgeInsets.all(15),
        components: _renderComponents());
  }
}
