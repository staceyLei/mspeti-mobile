import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/store/store.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/container/CardInfo/CardInfo.dart';

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:style.width - 15.0,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                'assets/image/headImg.png',
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
                  '${store.state.user.name}',
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/icon/icon-xunzhang.png'),
                      Text('0勋章',
                          style: TextStyle(color: Colors.white, fontSize: 11.0))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        InkWell(
          onTap: () {
            showDialog(context: context, builder: (_) => CardInfo());
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '我的资料卡',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              SizedBox(
                width: 5,
              ),
              Image.asset('assets/icon/arrow-right-white.png'),
              SizedBox(
                width: 20.0,
              ),
            ],
          )
          ),
        )
      ],
    ),
    );
  }
}
