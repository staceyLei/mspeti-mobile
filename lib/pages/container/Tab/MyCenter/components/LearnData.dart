import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class LearnPanel extends StatelessWidget {
  var learnData;
  var renderLearnData;
  LearnPanel({this.learnData, this.renderLearnData});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Container(
        width: style.width - 30,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Colors.black12,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('我的学习数据',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: this.renderLearnData(this.learnData),
            )
          ],
        ),
      ),
    );
  }
}

class LearnData extends StatelessWidget {
  String title;
  String value;
  LearnData({this.title, this.value, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 12.0)),
        SizedBox(
          height: 5.0,
        ),
        Text(value,
            style: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(43, 136, 244, 1),
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
