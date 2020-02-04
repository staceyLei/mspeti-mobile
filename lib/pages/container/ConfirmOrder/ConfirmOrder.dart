import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:flutter/services.dart';

class ConfirmOrder extends StatelessWidget {
  Widget renderBottom() {
    return Container(
      width: style.width,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("应付款:", style: style.baseFontStyle),
          Text(
            "¥54.00",
            style: style.baseFontStyle.copyWith(
              color: style.redColor,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              navigatorKey.currentState.pushNamed('/ConfirmPay');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              decoration: BoxDecoration(
                  color: style.themeColor,
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(0, 117, 255, 1),
                    style.themeColor,
                  ])),
              child: Text(
                '确认报名',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> renderComponents() {
    return <Widget>[
      Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(15.0),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: style.baseRadius),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 24.0,
                  height: 24.0,
                  child: Image.asset(
                    "assets/icon/icon-head.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '广州悦学悦知辅导机构',
                  style:
                      style.baseFontStyle.copyWith(fontSize: style.mFontSize),
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: style.baseRadius,
                    image: DecorationImage(
                      image: AssetImage("assets/icon/banner2.png"),
                      fit:BoxFit.cover,
                      )
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("寒假全期小/初/高数学辅导班",
                          style: TextStyle(
                              color: style.baseFontColor,
                              fontSize: style.sFontSize)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: style.baseRadius,
                          color: Color.fromRGBO(243, 243, 243, 1),
                        ),
                        child: Text('课时：64学时；人数：20人',
                            style: TextStyle(
                                color: style.lightGrey,
                                fontSize: style.sFontSize,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: style.baseRadius,
                          color: style.warnColor,
                        ),
                        child: Text('剩余：5',
                            style: TextStyle(
                                color: Color.fromRGBO(248, 126, 55, 1),
                                fontSize: style.sFontSize,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                Text(
                  '¥165',
                  style: style.baseFontStyle,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("任课老师", style: style.baseFontStyle),
                Text(
                  "张三 李四",
                  style: style.baseFontStyle,
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("课程优惠", style: style.baseFontStyle),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      //todo
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "-¥106",
                          style: TextStyle(
                              color: style.redColor,
                              fontSize: style.baseFontSize),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          child: Image.asset(
                            "assets/icon/arrow-right-grey.png",
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("课程时间", style: style.baseFontStyle),
                Text(
                  "2020-1-5 至 2020-1-24",
                  style: style.baseFontStyle,
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 48,
                  child: Text(
                    "备注",
                    style: style.baseFontStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: style.baseFontSize),
                        contentPadding: EdgeInsets.all(0),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: '选填，需要与机构协商一致'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(15.0),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: style.baseRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              child:
                  Image.asset('assets/icon/icon-ticket.png', fit: BoxFit.fill),
            ),
            SizedBox(
              width: 10,
            ),
            Text("可用优惠", style: style.baseFontStyle),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  //todo
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "5元券",
                      style: TextStyle(
                          color: style.redColor, fontSize: style.baseFontSize),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      child: Image.asset(
                        "assets/icon/arrow-right-grey.png",
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
        backgroundColor: style.grey,
        title: '确认报名',
        components: this.renderComponents(),
        bottom: this.renderBottom());
  }
}
