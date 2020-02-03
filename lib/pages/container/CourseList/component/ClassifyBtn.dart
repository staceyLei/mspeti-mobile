import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class ClassifyBtn extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function onTap;
  ClassifyBtn({this.isActive = false, this.title, this.onTap});
  TextStyle _active = TextStyle(
      color: style.themeColor, fontSize: style.mFontSize, fontWeight: FontWeight.bold);
  TextStyle _unActive =
      TextStyle(color: style.lightGrey, fontSize: style.mFontSize);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right:20),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
        decoration: BoxDecoration(
          border: Border(
              bottom: isActive
                  ? BorderSide(color: style.themeColor, width: 2.0)
                  : BorderSide.none),
        ),
        child: Text(title, style:isActive?_active:_unActive),
      ),
    );
  }
}
