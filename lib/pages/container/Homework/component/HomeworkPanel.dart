import 'package:educationapp/model/HomeworkM.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class HomeworkPanel extends StatelessWidget {
  final HomeworkM homework;

  final _colors = {
    '0': style.redColor,
    '1': style.orangeColor,
    '2': style.greenColor
  };
  final _alert = {'0': '未提交', '1': '待评改', '2': '已完成'};

  HomeworkPanel({this.homework});

  String _getFomatDate(String date) {
    return date.split(',').join('-');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.width - 30,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12, //阴影颜色
            blurRadius: 5.0, //阴影大小
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: _colors[homework.status],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(_alert[homework.status],
                style: style.secondFontStyle.copyWith(color: Colors.white)),
          ),
          SizedBox(height: 10),
          Text(
            homework.homeworkTitle,
            style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(homework.courseName,
                style: style.sFontStyle.copyWith(
                    fontWeight: FontWeight.bold, color: style.lightGrey)),
            Text(_getFomatDate(homework.pubDate),
                style: style.sFontStyle.copyWith(
                    fontWeight: FontWeight.bold, color: style.lightGrey))
          ])
        ],
      ),
    );
  }
}
