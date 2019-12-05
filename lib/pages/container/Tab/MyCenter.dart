import 'package:educationapp/assets/style.dart';
import 'package:flutter/material.dart';

class MyCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCenterState();
  }
}

class _MyCenterState extends State<MyCenter> {
  List _learnData = [
    {'title': '学习时长(分钟)', 'key': 1, 'value': '100'},
    {'title': '课程数量', 'key': 2, 'value': '5'},
    {'title': '个人成绩', 'key': 3, 'value': 'A'},
  ];

  List<Widget> _renderLearnData(List data) {
    List<Widget> learnRow = [];
    data.forEach((item) {
      learnRow.add(LearnData(title: item['title'], value: item['value']));
      if (item['key'] != 3) {
        learnRow.add(Image.asset('assets/icon/title-bar.png'));
      }
    });
    return learnRow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: width,
                        height: 300,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                        padding: EdgeInsets.fromLTRB(15, topPadding, 15, 15),
                        width: width,
                        height: 230,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(45, 118, 202, 0.9),
                              Color.fromRGBO(72, 131, 202, 0.8),
                            ],
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    print('设置');
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      'assets/icon/icon-setup.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ClipOval(
                                      child: Image.asset(
                                        'assets/image/headImg.png',
                                        fit: BoxFit.cover,
                                        width: 65,
                                        height: 65,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '小明',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5.0),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color:
                                                Color.fromRGBO(255, 159, 34, 1),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Image.asset(
                                                  'assets/icon/icon-xunzhang.png'),
                                              Text('0勋章',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11.0))
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    print('我的资料卡');
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '我的资料卡',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(
                                          'assets/icon/arrow-right-white.png'),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ) ,
                      Positioned(
                        right: 24,
                        bottom: 104,
                        child: Image.asset('assets/icon/circle-bg.png'),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: width - 30,
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20.0,),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:
                                    this._renderLearnData(this._learnData),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
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
                fontSize: 20.0, color: Color.fromRGBO(43, 136, 244, 1),
                fontWeight: FontWeight.bold,
                )),
      ],
    );
  }
}
