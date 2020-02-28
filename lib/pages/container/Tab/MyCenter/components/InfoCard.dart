import 'package:educationapp/model/Student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/store/store.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/container/CardInfo/CardInfo.dart';

class InfoCard extends StatelessWidget {
  final Student student;
  InfoCard(this.student);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.width - 15.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.network(
                  student.studentImg,
                  fit: BoxFit.cover,
                  width: 65,
                  height: 65,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    student.studentName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Color.fromRGBO(255, 159, 34, 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/icon/icon-xunzhang.png'),
                        Text(' 0勋章',
                            style:
                                style.sFontStyle.copyWith(color: Colors.white))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          InkWell(
            onTap: () {
              showDialog(context: context, builder: (_) => CardInfo(student));
            },
            child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text(
                      '我的资料卡',
                      style: style.mFontStyle.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset('assets/icon/arrow-right-white.png'),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
