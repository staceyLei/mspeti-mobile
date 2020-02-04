import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class BaseButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final String prefix;

  BaseButton({this.prefix = '',this.onTap, @required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: style.width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(color: style.borderColor, width: 0.5))),
          child: Row(
            mainAxisAlignment: prefix.isEmpty?MainAxisAlignment.center:MainAxisAlignment.start,
            children:[
              prefix.isNotEmpty? Container(
                margin: EdgeInsets.only(right:10),
                width:20,
                height:20,
                child:Image.asset(prefix,fit: BoxFit.contain,)
              ) : SizedBox(),
              Text(
            title,
            textAlign: prefix.isEmpty?TextAlign.center:TextAlign.left,
            style: style.mFontStyle,
          ),
            ]
          )
          
        ));
  }
}
