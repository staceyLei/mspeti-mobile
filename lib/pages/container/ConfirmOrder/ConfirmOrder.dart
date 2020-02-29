import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/provider/OrderListProvider.dart';
import 'package:educationapp/provider/ShopCartProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:provider/provider.dart';

class ConfirmOrder extends StatelessWidget {
  final arguments;
  List<CourseM> _courseList;
  bool _isFromCart;
  ConfirmOrder({this.arguments}) {
    _isFromCart = arguments['from'] == '0';
  }
  Widget _renderBottom(OrderListProvider order) {
    return Container(
      width: style.width,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("应付款:", style: style.baseFontStyle),
          Text(
            // _getTotalMoney(),
            order.totalPrice.toStringAsFixed(2),
            style: style.baseFontStyle.copyWith(
              color: style.redColor,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Consumer<ShopCartProvider>(
            builder: (context, shopCart, _) {
              return InkWell(
                onTap: () {
                  List<String> courseIds =
                      _courseList.map((e) => e.courseId).toList();
                  if (_isFromCart) {
                    // 如果来自购物车购买，则清除购物车对应项
                    shopCart.removeFromCart(courseIds);
                  }
                  navigatorKey.currentState.pushReplacementNamed('/ConfirmPay');
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  decoration: BoxDecoration(
                      color: style.themeColor,
                      borderRadius: BorderRadius.circular(14.0),
                      gradient: style.baseGradient),
                  child: Text(
                    '确认报名',
                    style: style.baseFontStyle.copyWith(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getTotalMoney() {
    double totalPrice = 0;
    _courseList.forEach((course) {
      totalPrice += double.parse(course.coursePrice);
      if (course.discount != null) {
        totalPrice -= double.parse(course.discount);
      }
    });
    totalPrice = totalPrice < 0 ? 0 : totalPrice;
    return '¥${totalPrice.toStringAsFixed(2)}';
  }

  Widget _renderItem(CourseM course) {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(15.0),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: style.baseRadius),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: style.baseRadius,
                    child: Image.network(course.courseImg,
                        width: style.width / 4,
                        height: style.width / 4,
                        fit: BoxFit.cover)),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(course.courseName,
                          style: style.mFontStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: style.baseRadius,
                          color: Color.fromRGBO(243, 243, 243, 1),
                        ),
                        child: Text(
                            '课时：${course.courseHours}学时；人数：${course.coursePeopleNum}人',
                            style: TextStyle(
                                color: style.lightGrey,
                                fontSize: style.sFontSize,
                                fontWeight: FontWeight.bold)),
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
                  '¥${course.coursePrice}',
                  style: style.mFontStyle,
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
                  course.courseTeacher.teacherName,
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
                    child: course.discount != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "-¥${course.discount}",
                                style: TextStyle(
                                    color: style.redColor,
                                    fontSize: style.baseFontSize),
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.only(left: 5),
                                child: Image.asset(
                                  "assets/icon/arrow-right-grey.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            ],
                          )
                        : Text('无',
                            style: style.baseFontStyle
                                .copyWith(color: style.secondFontColor)),
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
                  "${course.startDate} 至 ${course.endDate}",
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
                  margin: EdgeInsets.only(right: 5),
                  child: Text(
                    "备注",
                    style: style.baseFontStyle,
                    textAlign: TextAlign.right,
                  ),
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
    ]);
  }

  Widget _renderTicket() {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(15.0),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: style.baseRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            child: Image.asset('assets/icon/icon-ticket.png', fit: BoxFit.fill),
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
    );
  }

  List<Widget> _renderComponents() {
    List<Widget> res = _courseList.map((course) {
      return _renderItem(course);
    }).toList();
    return [...res, _renderTicket()];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderListProvider>(
      builder: (context, order, _) {
        _courseList = order.orderList;
        return NavLayout(
            backgroundColor: style.grey,
            title: '确认报名',
            components: _renderComponents(),
            bottom: _renderBottom(order));
      },
    );
  }
}
