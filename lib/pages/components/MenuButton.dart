import 'package:flutter/material.dart';
class MenuButton extends StatelessWidget {
  final onPressed;
  final String title;
  final Image image;

  MenuButton({this.onPressed, this.title, this.image, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: this.onPressed,
          iconSize: 54,
          icon: image,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12.0, color: Colors.grey),
        )
      ],
    );
  }
}