import 'package:educationapp/model/HomeworkM.dart';
import 'package:flutter/foundation.dart';
import 'const.dart';

class HomeworkProvider with ChangeNotifier {
  List<HomeworkM> _homeworkList = [];

  List<HomeworkM> get homeworkList => _homeworkList;

  initData() {
    _homeworkList = homeworkData.map((e) => HomeworkM.fromJson(e)).toList();
    notifyListeners();
  }

  List<HomeworkM> searchHomework(String year, String month) {
    List<HomeworkM> list = homeworkList.where((homework) {
      List<String> dateList = homework.pubDate.split(','); //获得年 月 日
      if (month == '0') {
        //本年度全部月份
        return dateList[0] == year;
      }
      return dateList[0] == year && dateList[1] == month;
    }).toList();
    return list;
  }
}
