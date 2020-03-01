import 'package:educationapp/model/CourseM.dart';
import 'package:flutter/foundation.dart';
import 'const.dart';

class CourseListProvider with ChangeNotifier {
  List<CourseM> _courseList =
      courseData?.map((e) => CourseM.fromJson(e))?.toList();

  List<CourseM> get courseList => _courseList;

  set setCourseList(List courseData) {
    _courseList = courseData.map((e) => CourseM.fromJson(e)).toList();
  }

  List<CourseM> searchForCourse(String keywords) {
    return courseList.where((c) => c.courseName.contains(keywords)).toList();
  }
}
