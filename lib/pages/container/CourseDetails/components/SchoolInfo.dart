import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class SchoolInfo extends StatelessWidget {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64.0,
                      child: Text(
                        '名称',
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
                        '广州悦学悦知辅导机构',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64.0,
                      child: Text(
                        '创办时间',
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
                        '1997年10月',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64.0,
                      child: Text(
                        '办学理念',
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
                        '愉快教育成功教育',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 64.0,
                      child: Text(
                        '学校介绍',
                        style: TextStyle(
                            color: style.secondFontColor,
                            fontSize: style.mFontSize),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      child: Text(
                        '''
                    卓越教育目前每年就读学生超过30万人次，拥有一支逾3000名优秀教师的师资队伍，开设了包括辅导班、一对一个性辅导、全日制高四(高考复读)、全日制初四(中考复读)在内100多个校区，遍布广州、上海、深圳、成都、佛山、珠海、东莞、中山、揭阳等城市，2010年、2011年连续两年入围“德勤高科技、高成长中国50强”，多年来获得多项来自政府、社会、媒体授予的奖项和荣誉。
                    ''',
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
            child: Text('学校简介',
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
                  gradient: LinearGradient(colors: [
                                  Color.fromRGBO(0, 117, 255, 1),
                                  style.themeColor,
                                ])
                ),
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
