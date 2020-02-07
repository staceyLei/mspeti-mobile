import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class GrowUpItem extends StatelessWidget {
  final String headImg;
  final String name;
  final String time;
  final String content;

  GrowUpItem({this.headImg, this.name, this.time, this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom:10),
      color: Colors.white,
      width: style.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  headImg,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  name,
                  style: style.mFontStyle,
                  maxLines: 2,
                ),
                Text(time,
                    style: style.sFontStyle.copyWith(color: style.lightGrey))
              ]),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 60),
              width: style.width-60,
              child: Column(
                children: <Widget>[
                  Text(content, style: style.baseFontStyle),
                  SizedBox(height: 15),
                ],
              ))
        ],
      ),
    );
  }
}
