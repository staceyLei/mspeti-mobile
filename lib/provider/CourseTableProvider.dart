import 'package:educationapp/model/CourseTable.dart';
import 'package:flutter/foundation.dart';
import 'const.dart';

class CourseTableProvider with ChangeNotifier {
  List<CourseTable> _courseTable = [];

  List<CourseTable> get courseTable => _courseTable;

  initData() {
    _courseTable = tableList.map((e) => CourseTable.fromJson(e)).toList();
    notifyListeners();
  }

  List<CourseTable> searchTable(String year, String month) {
    List<CourseTable> list = courseTable.where((table) {
      List<String> dateList = table.courseDate.split(','); //获得年 月 日
      return dateList[0] == year && dateList[1] == month;
    }).toList();
    return list;
  }
}
