import 'package:educationapp/model/Course.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class ShopCartItem extends StatelessWidget {
  final Course item;
  final bool isSelected;
  ShopCartItem({this.item, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: style.width-20,
        margin: EdgeInsets.fromLTRB(10,0,10,10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Container(
              width: 18,
              height: 18,
              child: Image.asset(isSelected
                  ? "assets/icon/collect-select.png"
                  : "assets/icon/collect-unselect.png")),
              SizedBox(width:10),
              Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: style.baseRadius,
                child: Image.network(item.courseImg, width: 100, height: 100,fit: BoxFit.cover,),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 1,
                child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.courseName,
                        style: style.mFontStyle.copyWith(fontWeight:FontWeight.bold)),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(item.courseTeacher,
                        style: style.baseFontStyle),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.symmetric(vertical:5),
                      decoration: BoxDecoration(
                        borderRadius: style.baseRadius,
                        color: Color.fromRGBO(243, 243, 243, 1),
                      ),
                      child: Text('课时：${item.courseHours}；人数：${item.coursePeopleNum}人',
                          style: TextStyle(
                              color: style.lightGrey,
                              fontSize: style.sFontSize,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: style.baseRadius,
                        color: style.warnColor,
                      ),
                      child: Text('剩余：5',
                          style: TextStyle(
                              color: Color.fromRGBO(248, 126, 55, 1),
                              fontSize: style.sFontSize,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Text(
                '¥${item.coursePrice}',
                style: style.baseFontStyle,
              ),
            ],
          ),flex:1)
        ]));
  }
}
