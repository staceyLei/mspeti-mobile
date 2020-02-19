import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:flutter/services.dart';
import 'const.dart';

class ConfirmPay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConfirmPayState();
  }
}

class _ConfirmPayState extends State<ConfirmPay> {
  String payVal = 'card';

  List<Widget> renderPayWay(value) {
    return payWay
        .map((item) => InkWell(
              onTap: () {
                setState(() {
                  this.payVal = item['value'];
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: item['id'] == payWay[payWay.length - 1]['id']?0:20.0),
                child: Row(
                children: <Widget>[
                  Container(
                    width: 24,
                    height: 24,
                    child: Image.asset(item['icon'],fit:BoxFit.contain),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item['label'],style: style.sFontStyle,),
                      item['tips'] == '' ?
                      SizedBox(height: 0,):
                      Text(item['tips'],
                      style:
                      TextStyle(fontSize: style.sFontSize,
                      color: item['value'] == 'card' ? style.redColor:style.lightGrey))
                    ],
                  ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset(value == item['value']?'assets/icon/radio-check.png':'assets/icon/radio-uncheck.png',fit:BoxFit.cover),
                  ),
                ],
              ),
              ),
            ))
        .toList();
  }

  Widget renderBottom() {
    return InkWell(
      onTap: () {
        //todo
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 0, 40, 15),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: style.width - 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(254, 131, 49, 1),
              Color.fromRGBO(255, 89, 3, 1)
            ])),
        child: Center(
          child: Text(
            '立即支付',
            style: TextStyle(color: Colors.white, fontSize: style.titleSize),
          ),
        ),
      ),
    );
  }

  List<Widget> renderComponents() {
    return <Widget>[
      Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(15.0),
        width: style.width,
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: style.baseRadius),
        child: Column(
          children: <Widget>[
            Text('应付金额',
                style: TextStyle(
                    color: style.lightGrey, fontSize: style.baseFontSize)),
            SizedBox(
              height: 10,
            ),
            Text('¥54.00',
                style: TextStyle(
                    color: style.redColor,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(15.0),
        width: style.width,
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: style.baseRadius),
        child: Column(
          children: this.renderPayWay(this.payVal),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
          backgroundColor: style.grey,
          title: '确认支付',
          components: this.renderComponents(),
          bottom: this.renderBottom()
    );
  }
}
