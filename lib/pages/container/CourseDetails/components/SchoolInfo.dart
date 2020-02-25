import 'package:educationapp/model/CommentM.dart';
import 'package:educationapp/model/Teacher.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class SchoolInfo extends StatelessWidget {
  Teacher teacher;
  SchoolInfo({this.teacher});

  int _getRank() {
    List<CommentM> comment = teacher.teacherComment;
    double rank = 0;
    comment.forEach((ele) {
      rank += double.parse(ele.star);
    });
    return rank ~/ comment.length;
  }

  Widget _renderStar(bool isActive) {
    return Container(
      width: 20,
      margin: EdgeInsets.symmetric(horizontal: 2.5),
      height: 20,
      child: Image.asset(
        isActive
            ? 'assets/icon/commentStar-active.png'
            : 'assets/icon/commentStar-unactive.png',
        fit: BoxFit.contain,
      ),
    );
  }

  List<Widget> _renderStarBox(int star) {
    List<Widget> res = [];
    while (res.length < star) {
      res.add(_renderStar(true));
    }
    while (res.length < 5) {
      res.add(_renderStar(false));
    }
    return res;
  }

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
              SizedBox(
                height: 15.0,
              ),
              Container(
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
                        '姓名',
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
                        teacher.teacherName,
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
                        '联系方式',
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
                        teacher.teacherPhone,
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
                        '评价星级',
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
                      child:Row(
                        children:_renderStarBox(_getRank())
                      )
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 64.0,
                      child: Text(
                        '个人简介',
                        style: TextStyle(
                            color: style.secondFontColor,
                            fontSize: style.mFontSize),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      width: style.width-3*15-75,
                      child: Text(
                        teacher.teacherInfo,
                        style: TextStyle(
                          fontSize: style.mFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              )
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
            child: Text('教师简介',
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
