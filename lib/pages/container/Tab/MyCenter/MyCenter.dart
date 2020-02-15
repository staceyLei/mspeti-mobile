import 'package:educationapp/assets/style.dart' as style;
import 'components/InfoCard.dart';
import 'package:flutter/material.dart';
import 'components/MenuBar.dart';
import 'components/LearnData.dart';
import 'package:educationapp/pages/components/NavBar.dart';

class MyCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCenterState();
  }
}

class _MyCenterState extends State<MyCenter> {
  final double DEFAULT_BAR = style.topPadding + 44;
  ScrollController _controller = ScrollController();
  double _barOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    double t;
    _controller.addListener(() {
      t = _controller.offset / DEFAULT_BAR;
      setState(() {
        if (t >= 1.0) {
          this._barOpacity = 1.0;
        } else if (t < 0.0) {
          this._barOpacity = 0.0;
        } else {
          this._barOpacity = t;
        }
      });
    });
  }

  List _learnData = [
    {'title': '学习时长(分钟)', 'key': 1, 'value': '100'},
    {'title': '课程数量', 'key': 2, 'value': '5'},
    {'title': '个人成绩', 'key': 3, 'value': 'A'},
  ];

  List _menuData = [
    {'title': '我的课程', 'leading': 'assets/icon/center-class.png', 'url': '/MyCourse'},
    {'title': '个人信息', 'leading': 'assets/icon/center-message.png', 'url': '/UserInfo'},
    {'title': '我的作业', 'leading': 'assets/icon/center-attend.png', 'url': '/Homework'},
    {'title': '我的成长', 'leading': 'assets/icon/center-grow.png', 'url': '/GrowUp'},
    {'title': '我的点评', 'leading': 'assets/icon/center-remark.png', 'url': '/Comment'},
    {'title': '我的收藏', 'leading': 'assets/icon/collection.png', 'url': '/Collection'},
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

  List<Widget> _getMenuBar(List data) {
    if (data.length != null) {
      return data
          .map((item) => MenuBar(
                title: item['title'],
                leading: item['leading'],
                url: item['url'],
              ))
          .toList();
    }
    return null;
  }

  List<Widget> renderNavBar() {
    return <Widget>[
      ClipOval(
        child: Image.asset(
          'assets/image/headImg.png',
          fit: BoxFit.cover,
          width: 35,
          height: 35,
        ),
      ),
      Text('个人中心', style: TextStyle(color: Colors.white, fontSize: 16.0)),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/SetUp');
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.bgColor,
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: style.width,
                        height: 310,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.fromLTRB(15, style.topPadding, 15, 15),
                          width: style.width,
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
                                      Navigator.pushNamed(context, '/SetUp');
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
                              // 我的资料卡板块
                              // InfoCard(),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 24,
                        bottom: 114,
                        child: Image.asset('assets/icon/circle-bg.png'),
                      ),
                      Positioned(
                        left: 15.0,
                        top: this.DEFAULT_BAR,
                        child: InfoCard()
                        ),
                      // 我的学习数据板块
                      LearnPanel(
                        renderLearnData: this._renderLearnData,
                        learnData: this._learnData,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: this._getMenuBar(this._menuData),
                    ),
                  )
                ],
              ),
            ),
          ),
          // 渐变导航栏
          _barOpacity > 0 ? NavBar(
            barOpacity: this._barOpacity,
            barHeight: this.DEFAULT_BAR,
            comonent: this.renderNavBar(),
            color: Color.fromRGBO(45, 118, 202, 1),
          ):SizedBox(),
        ],
      ),
    );
  }
}
