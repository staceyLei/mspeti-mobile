import 'package:flutter/material.dart';

class StarBox extends StatelessWidget {
  final int star;
  StarBox({this.star = 0});

  List<Widget> renderStar() {
    List<Widget> stars = [];
    for (var i = 0; i < this.star; i++) {
      stars.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 2.5),
        width: 20.0,
        height: 15.0,
        child: Image.asset(
          "assets/icon/icon-star-active.png",
          fit: BoxFit.fitHeight,
        ),
      ));
    }
    for (var i = this.star; i < 5; i++) {
      stars.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 2.5),
        width: 20.0,
        height: 15.0,
        child: Image.asset(
          "assets/icon/icon-star-unactive.png",
          fit: BoxFit.fitHeight,
        ),
      ));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: this.renderStar(),
    );
  }
}
