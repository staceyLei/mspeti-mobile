import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';

class NavLayout extends StatelessWidget {
  final List<Widget> components;
  final String title;
  final Color backgroundColor;
  final Widget bottom;
  final Widget right;
  final double rightDistance;
  final EdgeInsets padding;

  NavLayout(
      {this.components,
      this.title,
      this.backgroundColor,
      this.bottom,
      this.rightDistance,
      this.padding,
      this.right});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: backgroundColor,
            resizeToAvoidBottomPadding: false,
            body: Column(
              children: <Widget>[
                Container(
                  width: style.width,
                  padding:
                      EdgeInsets.fromLTRB(15, style.topPadding + 10, 15, 10),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: style.grey, width: 1.0)),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
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
                      rightDistance != null ? SizedBox(width: rightDistance-25,):SizedBox(),
                      Expanded(
                        flex: 1,
                        child: Text(this.title,
                            textAlign: TextAlign.center,
                            style: style.baseFontStyle
                                .copyWith(fontSize: style.titleSize)),
                      ),
                      right ??
                          SizedBox(
                            width: rightDistance??25,
                          ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: padding,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: this.components,
                      ),
                    ),
                  ),
                ),
                this.bottom ?? SizedBox(),
              ],
            )));
  }
}
