import 'package:educationapp/model/CourseM.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CourseItem extends StatelessWidget {
  final CourseM item;
  CourseItem({this.item});

  @override
  Widget build(BuildContext context) {
    double itemH = style.width / 3 - 10;
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/CourseDetails',
              arguments: {"courseId": item.courseId, 'course': item});
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: style.baseRadius,
                child: Image.network(item.courseImg,
                    width: itemH,
                    height: itemH,
                    fit: BoxFit.cover),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:10),
                    height: itemH,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item.courseName,
                              style: style.baseFontStyle
                                  .copyWith(fontSize: style.mFontSize)),
                          Text(item.courseInfo,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: style.lightGrey,
                                  fontSize: style.baseFontSize)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '¥',
                                  style: TextStyle(
                                      color: style.redColor,
                                      fontSize: style.baseFontSize),
                                ),
                                Text(item.coursePrice,
                                    style: TextStyle(
                                        color: style.redColor,
                                        fontSize: style.bigFontSize,
                                        fontWeight: FontWeight.bold)),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('${item.coursePeopleNum}人付款',
                                    style: TextStyle(
                                        color: style.lightGrey,
                                        fontSize: style.baseFontSize)),
                                Text('. . .',
                                    style: TextStyle(
                                        color: style.lightGrey,
                                        fontSize: style.baseFontSize)),
                              ]),
                        ]),
                  )),
            ],
          ),
        ));
  }
}
