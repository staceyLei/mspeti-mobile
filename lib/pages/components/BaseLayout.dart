import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';

class BaseLayout extends StatelessWidget {
  final Widget components;
  final String title;
  final Color backgroundColor;
  final Widget navBarB;
  final Widget right;
  final bool hasBorder;

  BaseLayout(
      {this.components,
      this.title,
      this.backgroundColor,
      this.right,
      this.hasBorder = true,
      this.navBarB});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Column(
              children: <Widget>[
                Container(
                  width: style.width,
                  padding:
                      EdgeInsets.fromLTRB(15, style.topPadding + 10, 15, 10),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: hasBorder
                            ? BorderSide(color: style.grey, width: 1.0)
                            : BorderSide.none),
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
                      Expanded(
                        flex: 1,
                        child: Text(this.title,
                            textAlign: TextAlign.center,
                            style: style.baseFontStyle
                                .copyWith(fontSize: style.titleSize)),
                      ),
                      right ??
                          SizedBox(
                            width: 25,
                          ),
                    ],
                  ),
                ),
                navBarB ?? SizedBox(),
                SizedBox(height: 5),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: this.backgroundColor,
                    child: this.components,
                  ),
                ),
              ],
            )));
  }
}
