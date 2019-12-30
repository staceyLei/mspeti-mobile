import 'package:flutter/material.dart';

class ButtonLink extends StatelessWidget {
  var title;
  var handleOnTap;
  ButtonLink({this.title, this.handleOnTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.blue, fontSize: 12.0),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 10.0,
            height: 10.0,
            child: Image.asset(
              "assets/icon/arrow-right-blue.png",
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
