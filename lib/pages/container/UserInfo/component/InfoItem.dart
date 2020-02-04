import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class InfoItem extends StatelessWidget {
  final String title;
  final Widget content;
  final Function action;
  final bool isModify;
  final Widget prefix;

  InfoItem(
      {this.title,
      this.content,
      this.action,
      this.isModify = false,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        padding: EdgeInsets.only(left: 15),
        color: Colors.white,
        child: Container(
        padding: EdgeInsets.fromLTRB(5, 15, 15, 15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: style.borderColor, width: 1.0))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(title, style: style.mFontStyle),
                  SizedBox(width: 5,),
                  prefix??SizedBox(width: 0,),
                ],
              ),
            ),
            content
            ??
            Text('未设置',style:style.secondFontStyle.copyWith(fontSize:style.mFontSize)),
            isModify
                ? Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.keyboard_arrow_right, size: 20.0,color: style.lightGrey,),
                  )
                : SizedBox(
                  ),
          ],
        ),
      ),
      ),
    );
  }
}
