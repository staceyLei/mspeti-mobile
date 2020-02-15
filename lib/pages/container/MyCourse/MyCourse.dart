import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/components/NavLayout.dart';
import 'component/CourseItem.dart';
import 'component/const.dart';

class MyCourse extends StatelessWidget {
  List<Widget> _renderComponents() {
    return (courseData ?? []).map((item) {
      return InkWell(
          onTap: () {
            navigatorKey.currentState
                .pushNamed('/CourseContent', arguments: {'item': item});
          },
          child: CourseItem(item: item));
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
