import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/BaseLayout.dart';

class PayResult extends StatelessWidget {
  const PayResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: '支付结果',
        backgroundColor: Colors.white,
        components: Column(
          children: <Widget>[
            Container(
              width: style.width / 4,
              margin: EdgeInsets.all(20),
              child: Image.asset('assets/icon/pay-success.png',
                  fit: BoxFit.fitWidth),
            ),
            Text('支付成功',
                style: TextStyle(
                    color: style.baseFontColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                  margin: EdgeInsets.all(15),
                  width: style.width - 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: style.baseRadius,
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(254, 131, 49, 1),
                        Color.fromRGBO(255, 89, 3, 1)
                      ])),
                  child: Text('返回首页',textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: style.titleSize))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/MyCourse');
              },
              child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(10),
                  width: style.width - 80,
                  decoration: BoxDecoration(
                      borderRadius: style.baseRadius,
                      gradient: LinearGradient(colors: [
                        style.redColor,
                        Color.fromRGBO(255, 89, 3, 1)
                      ])),
                  child: Text('查看我的课程',textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: style.titleSize))),
            )
          ],
        ));
  }
}
