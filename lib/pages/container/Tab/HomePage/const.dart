import 'package:flutter/material.dart';
class MyConst {
  static var menuList = [
    {
      "title": "我的课表",
      "image": Image.asset(
        "assets/icon/menu-class.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
    {
      "title": "课堂作业",
      "image": Image.asset(
        "assets/icon/menu-homework.png",
        fit: BoxFit.fill,
      ),
      "url": '/Homework',
    },
    {
      "title": "课堂考勤",
      "image": Image.asset(
        "assets/icon/menu-attend.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
    {
      "title": "每日阅读",
      "image": Image.asset(
        "assets/icon/menu-reading.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
    {
      "title": "我的成绩",
      "image": Image.asset(
        "assets/icon/menu-result.png",
        fit: BoxFit.fill,
      ),
    },
    {
      "title": "我的点评",
      "image": Image.asset(
        "assets/icon/menu-remark.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
  ];
}