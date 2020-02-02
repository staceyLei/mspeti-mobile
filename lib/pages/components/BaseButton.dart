import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class BaseButton extends StatelessWidget {
  final Function onTap;
  final String title;

  BaseButton({this.onTap, @required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: style.width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: style.borderColor, width: 0.5))),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: style.mFontStyle,
          ),
        ));
  }
}
