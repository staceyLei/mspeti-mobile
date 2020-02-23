import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class NavBar extends StatelessWidget {
  final String title;
  final bool status;
  final Function handleOnManage;
  NavBar({this.status, this.title,this.handleOnManage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, style.topPadding, 10, 15),
      decoration: BoxDecoration(gradient: style.baseGradient),
      child: Row(children: [
        SizedBox(
          width: 40,
        ),
        Expanded(
            child: Text(title,
            textAlign: TextAlign.center,
                style: style.mFontStyle
                    .copyWith(fontSize: style.bigFontSize, color: Colors.white)),
            flex: 1),
        GestureDetector(
          onTap:handleOnManage,
          child: Container(
            width: 40,
            child: Text(status ? '管理' : '完成',
                style: style.mFontStyle.copyWith(color: Colors.white,fontSize: style.titleSize))),
        )
      ]),
    );
  }
}
