import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class TimeTableItem extends StatelessWidget {
  final Map item;
  TimeTableItem({this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
      decoration: BoxDecoration(
        color: Colors.white, 
        boxShadow: [
        BoxShadow(
            blurRadius: 2,
            offset: Offset(2, 2),
            color: Color.fromRGBO(0, 0, 0, 0.05))
      ]
      ),
      child: Column(children: [
        Row(
          children: <Widget>[
            SizedBox(
              width: 14,
              height: 14,
              child: Image.asset(
                'assets/icon/timetable-circle.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 5),
            Text(
              '${item['startTime']} - ${item['endTime']}',
              style: style.baseFontStyle.copyWith(color: style.grey200),
            )
          ],
        ),
        SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(left: BorderSide(color: style.grey, width: 4))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item['courseName'],
                  style: style.baseFontStyle.copyWith(
                      fontSize: style.titleSize, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(item['courseTeacher'],
                  style: style.mFontStyle.copyWith(
                      color: style.lightGrey, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('[${item['courseHours']}学时]',
                  style: style.sFontStyle.copyWith(color: style.lightGrey)),
            ]),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(item['courseImg'],
                  fit: BoxFit.cover, width: 70, height: 70))
        ])
      ]),
    );
  }
}
