import 'package:educationapp/model/CourseM.dart';
import 'package:flutter/foundation.dart';

class OrderListProvider with ChangeNotifier {
  List<CourseM> _orderList = [];
  double _totalPrice = 0;

  double get totalPrice {
    _totalPrice = 0;
    _orderList.forEach((course) {
      _totalPrice += double.parse(course.coursePrice);
      if (course.discount != null) {
        _totalPrice -= double.parse(course.discount);
      }
    });
    _totalPrice = _totalPrice < 0 ? 0 : _totalPrice;
    return _totalPrice;
  }

  List<CourseM> get orderList => _orderList;

  initData(List<CourseM> list) {
    _orderList = list;
    notifyListeners();
  }

  cleanOrder() {
    _orderList = [];
    notifyListeners();
  }
}
