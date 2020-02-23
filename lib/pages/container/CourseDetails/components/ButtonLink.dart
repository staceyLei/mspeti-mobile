import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class ButtonLink extends StatelessWidget {
  var title;
  var handleOnTap;
  ButtonLink({this.title, @required this.handleOnTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.handleOnTap,
      child: Row(
        children: <Widget>[
          Text(
            title,
            style:style.baseFontStyle.copyWith(color:Colors.blue),
            textAlign: TextAlign.center,
          ),
          SizedBox(width:5),
            Image.asset(
              "assets/icon/arrow-right-blue.png",
            ),
        ],
      ),
    );
  }
}
