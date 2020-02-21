import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CourseItem extends StatelessWidget {
  final Map item;
  CourseItem({this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/CourseDetails',arguments:{"courseId":item['id']});
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: style.baseRadius,
                    image: DecorationImage(
                        image: AssetImage(item['img']), fit: BoxFit.cover)),
                width: 100,
                height: 100,
              ),
              SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item['name'],
                              style: style.baseFontStyle
                                  .copyWith(fontSize: style.mFontSize)),
                          Text(item['info'],
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
                                Text(item['price'],
                                    style: TextStyle(
                                        color: style.redColor,
                                        fontSize: style.bigFontSize,
                                        fontWeight: FontWeight.bold)),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('${item['pay']}人付款',
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
