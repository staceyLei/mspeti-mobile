import 'package:flutter/material.dart';
class MyConst {
  static var menuList = [
    {
      "title": "课程日历",
      "image": Image.asset(
        "assets/icon/menu-class.png",
        fit: BoxFit.fill,
      ),
      "url": '/TimeTable',
    },
    {
      "title": "课堂作业",
      "image": Image.asset(
        "assets/icon/menu-homework.png",
        fit: BoxFit.fill,
      ),
      "url": '/Homework',
    },
    // {
    //   "title": "课堂考勤",
    //   "image": Image.asset(
    //     "assets/icon/menu-attend.png",
    //     fit: BoxFit.fill,
    //   ),
    //   "url": '',
    // },
    {
      "title": "我的课程",
      "image": Image.asset(
        "assets/icon/menu-reading.png",
        fit: BoxFit.fill,
      ),
      "url": '/MyCourse',
    },
    {
      "title": "我的成长",
      "image": Image.asset(
        "assets/icon/menu-result.png",
        fit: BoxFit.fill,
      ),
      "url":"/GrowUp"
    },
    {
      "title": "我的点评",
      "image": Image.asset(
        "assets/icon/menu-remark.png",
        fit: BoxFit.fill,
      ),
      "url": '/Comment',
    },
    {
      "title": "我的收藏",
      "image": Image.asset(
        "assets/icon/menu-collect.png",
        fit: BoxFit.fill,
      ),
      "url": '/Collection',
    }
  ];
}