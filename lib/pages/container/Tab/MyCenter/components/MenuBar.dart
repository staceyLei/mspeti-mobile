import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class MenuBar extends StatelessWidget {
  String leading;
  String title;
  String url;
  MenuBar({Key key, this.title, this.url, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (InkWell(
      onTap: () {
        print('url:$url');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: style.borderColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 28,
                  height: 28,
                  child: Image.asset(leading, fit: BoxFit.contain),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(title, style: TextStyle(fontSize: 16.0)),
              ],
            ),
            Container(
              width: 14,
              height: 14,
              child: Image.asset(
                'assets/icon/arrow-right-black.png',
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
