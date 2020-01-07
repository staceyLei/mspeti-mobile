import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class NavLayout extends StatelessWidget {
  final List<Widget> components;
  final String title;
  final Color backgroundColor;
  final Widget bottom;

  NavLayout({this.components, this.title,this.backgroundColor,this.bottom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          width: style.width,
          padding: EdgeInsets.fromLTRB(15, style.topPadding, 15, 10),
          color: this.backgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 25,
                  height: 25,
                  padding: EdgeInsets.all(5.0),
                  child: Image.asset(
                    "assets/icon/arrow-left-black.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(this.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: style.baseFontColor, fontSize: style.titleSize)),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: this.components,
            ),
          ),
        ),
        this.bottom,
      ],
    ));
  }
}
