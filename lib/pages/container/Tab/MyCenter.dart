import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/material.dart';

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
    {'title': '我的课程', 'leading': 'assets/icon/center-class.png', 'url': ''},
    {'title': '个人信息', 'leading': 'assets/icon/center-message.png', 'url': ''},
    {'title': '课堂情况', 'leading': 'assets/icon/center-attend.png', 'url': ''},
    {'title': '成长记录', 'leading': 'assets/icon/center-grow.png', 'url': ''},
    {'title': '我的评价', 'leading': 'assets/icon/center-remark.png', 'url': ''}
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                              color: Color.fromRGBO(
                                                  255, 159, 34, 1),
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
                      ),
                      Positioned(
                        right: 24,
                        bottom: 114,
                        child: Image.asset('assets/icon/circle-bg.png'),
                      ),
                      Positioned(
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
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20.0,
                              ),
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
          Positioned(
            top: this._barOpacity > 0 ? 0 : DEFAULT_BAR,//层级问题，挡住底层设置按钮
            child: Opacity(
              opacity: this._barOpacity,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(45, 118, 202, 1),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12, //阴影颜色
                      blurRadius: 20.0, //阴影大小
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(15, style.topPadding, 15, 10),
                width: style.width,
                height: this.DEFAULT_BAR,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        'assets/image/headImg.png',
                        fit: BoxFit.cover,
                        width: 35,
                        height: 35,
                      ),
                    ),
                    Text('个人中心',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
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
              fontSize: 20.0,
              color: Color.fromRGBO(43, 136, 244, 1),
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}

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
