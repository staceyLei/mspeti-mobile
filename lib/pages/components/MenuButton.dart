import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class MenuButton extends StatelessWidget {
  final onPressed;
  final String title;
  final Image image;

  MenuButton({this.onPressed, this.title, this.image, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          onPressed: this.onPressed,
          iconSize: (style.width - 150) / 4,
          icon: image,
        ),
        Text(
          title,
          style: style.baseFontStyle.copyWith(color: style.lightGrey),
        )
      ],
    );
  }
}
