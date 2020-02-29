import 'package:educationapp/model/CourseM.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'const.dart';

class ShopCartProvider with ChangeNotifier {
  List<CourseM> _shopCartList = [];

  List<CourseM> get shopCartList => _shopCartList;
  int get shopCartNum => _shopCartList.length;

  set setShopCartList(List shopCartData) {
    _shopCartList = shopCartData.map((e) => CourseM.fromJson(e)).toList();
  }

  // 初始化数据
  initData() {
    _shopCartList = shopCartData.map((e) => CourseM.fromJson(e)).toList();
    notifyListeners();
  }

  addToCart(CourseM course) {
    bool hasAdd = hasCourse(course);
    List<CourseM> newShopCartList = [..._shopCartList];
    String tips = '课程已在购物车中~';
    if (!hasAdd) {
      newShopCartList = [...newShopCartList, course];
      tips = '添加购物车成功';
    }
    _shopCartList = newShopCartList;
    Fluttertoast.showToast(msg: tips, gravity: ToastGravity.CENTER);
    notifyListeners();
  }

  removeFromCart(List<String> courseIds) {
    List<CourseM> newList = _shopCartList
        .where((ele) => !courseIds.contains(ele.courseId))
        .toList();
    _shopCartList = newList;
    notifyListeners();
  }

  hasCourse(CourseM course) {
    var res = _shopCartList.where((e) => e.courseId == course.courseId);
    return res.isNotEmpty;
  }
}
