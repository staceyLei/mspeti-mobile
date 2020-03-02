import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CardItem extends StatelessWidget {
  final String title;
  final String value;

  CardItem({this.title, this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title,
            style:
                TextStyle(color: style.lightGrey, 
                fontSize: style.baseFontSize,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none
                )),
        SizedBox(height: 5),
        Text(value,
            style: TextStyle(
                color: style.baseFontColor,
                fontSize: style.titleSize,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
                ))
      ],
    );
  }
}
