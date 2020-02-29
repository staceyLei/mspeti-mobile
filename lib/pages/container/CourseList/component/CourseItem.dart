import 'package:educationapp/model/CourseM.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CourseItem extends StatelessWidget {
  final CourseM item;
  final bool layout;
  CourseItem({this.item, this.layout});

  Widget _renderColumn() {
    double itemH = style.width / 3 - 20;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              borderRadius: style.baseRadius,
              child: Image.network(item.courseImg,
                  width: itemH, height: itemH, fit: BoxFit.cover)),
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: itemH,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item.courseName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
    );
  }

  Widget _renderRow() {
    double itemH = (style.width - 3 * 15) / 2;
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      decoration:
          BoxDecoration(borderRadius: style.baseRadius, color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
            child: Image.network(item.courseImg,width:itemH,height:itemH,fit:BoxFit.cover),
          ),
          Container(
            width: itemH,
            padding: EdgeInsets.symmetric(horizontal: 5),
            margin: EdgeInsets.only(top:5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.courseName,
                    maxLines: 2,
                    style: style.baseFontStyle
                        .copyWith(fontSize: style.mFontSize)),
                SizedBox(height: 5),
                Text(item.courseInfo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: style.lightGrey, fontSize: style.baseFontSize)),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
                    Text('${item.coursePeopleNum}人付款',
                        style: TextStyle(
                            color: style.lightGrey,
                            fontSize: style.baseFontSize)),
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(right: 5.0),
              child: Text('. . .',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: style.lightGrey, fontSize: style.baseFontSize)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/CourseDetails',
              arguments: {"courseId": item.courseId,'course':item});
        },
        child: layout ? _renderRow() : _renderColumn());
  }
}
