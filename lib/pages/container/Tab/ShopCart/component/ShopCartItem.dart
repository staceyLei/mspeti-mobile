import 'package:educationapp/model/CourseM.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class ShopCartItem extends StatelessWidget {
  final CourseM item;
  final bool isSelected;
  final Function handleOnSelect;
  ShopCartItem({this.item, this.isSelected,this.handleOnSelect});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: style.width - 20,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          GestureDetector(
            onTap:handleOnSelect,
            child:Container(
              width: 28,
              padding: EdgeInsets.only(right:10),
              height: style.width/3-10,
              child: ClipRect(
                child:Image.asset(isSelected
                  ? "assets/icon/collect-select.png"
                  : "assets/icon/collect-unselect.png",width: 18,height: 18,)
              )
              ),
          ),
          Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: style.baseRadius,
                    child: Image.network(
                      item.courseImg,
                      width: style.width/3-10,
                      height: style.width/3-10,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(item.courseName,
                            style: style.mFontStyle
                                .copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(item.courseTeacher.teacherName,
                            style: style.baseFontStyle),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: style.baseRadius,
                            color: Color.fromRGBO(243, 243, 243, 1),
                          ),
                          child: Text(
                              '课时：${item.courseHours}；人数：${item.coursePeopleNum}人',
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
                    style: style.mFontStyle,
                  ),
                ],
              ),
              flex: 1)
        ]));
  }
}
