import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CourseItem extends StatelessWidget {
  final Map item;
  double _percent;
  double _total;
  CourseItem({this.item}) {
    _total = (style.width - 2 * 15 - 2 * 20 - 20);
    _percent = ((double.parse(item['nowCourseHours']) /
        double.parse(item['courseHours'])));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black12)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(item['courseImg'],
                  width: 80, height: 80, fit: BoxFit.cover),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['courseName'],
                          style: style.mFontStyle.copyWith(
                              fontSize: style.titleSize,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(item['courseTeacher'], style: style.mFontStyle),
                      SizedBox(height: 5),
                      Text(
                        '共${item['courseHours']}学时',
                        style: style.mFontStyle.copyWith(
                            color: style.lightGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(item['nowCourseHours'] ?? '0',
                    style: style.baseFontStyle.copyWith(
                        color: style.themeColor, fontWeight: FontWeight.bold)),
                Text("/${item['courseHours']}",
                    style: style.baseFontStyle
                        .copyWith(fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        Row(children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                width: _total,
                height: 1,
                color: style.lightGrey,
              ),
              Container(
                height: 4,
                width: _percent * _total,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    gradient: style.baseGradient),
              )
            ],
          ),
          SizedBox(width: 10),
          Expanded(
              child: Text('${(_percent * 100).toStringAsFixed(0)}%',
                  style: style.sFontStyle.copyWith(
                      color: style.themeColor, fontWeight: FontWeight.bold)),
              flex: 1),
        ]),
      ]),
    );
  }
}
