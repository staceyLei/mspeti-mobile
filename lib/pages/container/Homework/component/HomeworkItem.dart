import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class HomeworkItem extends StatelessWidget {
  final String number;
  final String title;
  final bool isChecked;

  final checked = TextStyle(
      color: style.themeColor, fontSize: style.bigFontSize, fontWeight: FontWeight.bold);
  final unChecked = TextStyle(
      color: style.lightGrey, fontSize: style.bigFontSize, fontWeight: FontWeight.bold);
  HomeworkItem({this.number, this.title, this.isChecked = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      width: (style.width - 30)/4-10,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12, //阴影颜色
              blurRadius: 5.0, //阴影大小
            ),
          ],
              ),
      child: Column(
        children:[
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(number, style: isChecked ? checked : unChecked),
              Text(title,
                  style: isChecked
                      ? checked.copyWith(fontSize: style.sFontSize)
                      : unChecked.copyWith(fontSize: style.sFontSize))
            ],
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              isChecked
                  ? 'assets/icon/homework-check.png'
                  : 'assets/icon/homework-uncheck.png',
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
      SizedBox(height:5),
      Container(
        height: 3,
        decoration: BoxDecoration(
          color:isChecked?style.themeColor:Colors.transparent,
          borderRadius:BorderRadius.vertical(bottom:Radius.circular(10)),
        ),
      )
        ]
      )
      
    );
  }
}
