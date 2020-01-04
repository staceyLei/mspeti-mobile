import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class NavBar extends StatelessWidget {
  final double barOpacity;
  final barHeight;
  final List<Widget> comonent;
  final bool shadow;
  final color;
  NavBar({this.barHeight, this.barOpacity, Key key, this.comonent, this.color,this.shadow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: this.barOpacity > 0 ? 0 : this.barHeight, //层级问题，挡住底层设置按钮
      child: Opacity(
        opacity: this.barOpacity,
        child: Container(
          decoration: BoxDecoration(
            color: this.color,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: this.shadow?Colors.black12:Colors.transparent, //阴影颜色
                blurRadius: 20.0, //阴影大小
              ),
            ],
          ),
          padding: EdgeInsets.fromLTRB(15, style.topPadding, 15, 10),
          width: style.width,
          height: this.barHeight,
          child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:this.comonent),
        ),
      ),
    );
  }
}
