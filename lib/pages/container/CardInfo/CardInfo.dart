import 'package:educationapp/model/Student.dart';
import 'package:educationapp/pages/components/Skeleton.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'CardItem.dart';

class CardInfo extends StatelessWidget {
  final Student student;
  CardInfo(this.student);
  @override
  Widget build(BuildContext context) {
    double top = style.height / 8;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, top, 20, 0),
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Positioned(
          child: Column(
            children: <Widget>[
              Container(
                height: 106,
                margin: EdgeInsets.only(top: 50),
                width: style.width - 40,
                padding: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage("assets/image/card-bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        student.studentName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: style.titleSize,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(height: 5),
                      Text(student.studentId,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: style.baseFontSize,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none))
                    ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: style.borderColor, width: 0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 16,
                      height: 16,
                      child: Image.asset(
                        student.studentGender == '0'?"assets/icon/icon-male.png":
                        "assets/icon/icon-female.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text('${student.studentAge}岁', style:student.studentGender == '0'?style.maleStyle: style.femaleStyle),
                    SizedBox(width: 5),
                    Text(student.studentAddress, style: student.studentGender == '0'?style.maleStyle: style.femaleStyle),
                  ],
                ),
              ),
              Container(
                width: style.width - 40,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CardItem(title: '学习时长(分钟)', value: '100'),
                        CardItem(title: '课程数', value: '5'),
                        CardItem(title: '综合评价', value: 'A'),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CardItem(title: '出勤率', value: '90%'),
                        CardItem(title: '收藏课程', value: '10'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 0,
            child: Skeleton(
              img:student.studentImg,
              size:style.width/4
            )
            ),
      ]),
    );
  }
}
