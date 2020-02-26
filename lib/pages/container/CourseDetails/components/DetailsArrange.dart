import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/pages/components/CourseArrangeTable.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class DetailsArrange extends StatelessWidget {
  final CourseM course;
  DetailsArrange({@required this.course});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 30.0,
          width: double.infinity,
          color: Colors.black54,
        ),
        Container(
          width: style.width,
          height: style.height * 0.55,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:15),
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: style.borderColor, width: 1.0)),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 64.0,
                      child: Text(
                        '时间范围',
                        style: TextStyle(
                            color: style.secondFontColor,
                            fontSize: style.mFontSize),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${course.startDate} - ${course.endDate}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: style.mFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom:20),
                padding: EdgeInsets.fromLTRB(5, 10, 5, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 64.0,
                      margin: EdgeInsets.only(bottom:15),
                      child: Text(
                        '课表简介',
                        style: TextStyle(
                            color: style.secondFontColor,
                            fontSize: style.mFontSize),
                      ),
                    ),
                    CourseArrangeTable(course.courseTime)
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: style.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Text('课程安排',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: style.titleSize, fontWeight: FontWeight.bold)),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            width: style.width,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: style.baseGradient),
                child: Text(
                  '确定',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: style.mFontSize),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
