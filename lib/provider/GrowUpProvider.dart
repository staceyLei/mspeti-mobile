import 'package:educationapp/model/GrowUpM.dart';
import 'package:flutter/foundation.dart';
import 'const.dart';

class GrowUpProvider with ChangeNotifier {
  List<GrowUpM> _growUpList = [];

  List<GrowUpM> get growUpList => _growUpList;

  initData() {
    _growUpList = growUp.map((e) => GrowUpM.fromJson(e)).toList();
    notifyListeners();
  }

  List<GrowUpM> searchGrowUp(String year, String month) {
    List<GrowUpM> list = growUpList.where((item) {
      List<String> dateList = item.pubDate.split(','); //获得年 月 日
      if (month == '0') {
        //本年度全部月份
        return dateList[0] == year;
      }
      return dateList[0] == year && dateList[1] == month;
    }).toList();
    return list;
  }

  addNewGrowUp(GrowUpM newItem) {
    newItem.growUpId = (growUpList.length + 1).toString();
    _growUpList = [..._growUpList, newItem];
    notifyListeners();
  }
}
