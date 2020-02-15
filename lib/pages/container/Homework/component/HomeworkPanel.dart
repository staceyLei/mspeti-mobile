import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'const.dart';

class HomeworkPanel extends StatelessWidget {
  final String status;
  final String title;
  final String course;
  final String time;

  final _colors = {
    '0': style.redColor,
    '1': style.orangeColor,
    '2': style.greenColor
  };
  final _alert = {'0': '未提交', '1': '待评改', '2': '已完成'};

  HomeworkPanel({this.status, this.time, this.title, this.course});

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
              color: _colors[status],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(_alert[status],style:style.secondFontStyle.copyWith(color:Colors.white)),
          ),
          SizedBox(height:10),
          Text(title,style:style.mFontStyle.copyWith(fontWeight:FontWeight.bold),maxLines: 2,),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(course,style:style.sFontStyle.copyWith(fontWeight:FontWeight.bold,color:style.lightGrey)),
              Text(time,style:style.sFontStyle.copyWith(fontWeight:FontWeight.bold,
              color:style.lightGrey))
            ]
          )
        ],
      ),
    );
  }
}
