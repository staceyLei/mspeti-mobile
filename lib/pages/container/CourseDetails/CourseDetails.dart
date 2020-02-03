import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavBar.dart';
import 'package:flutter/services.dart';
import 'components/ButtonLink.dart';
import 'components/CommentsPanel.dart';
import 'components/SchoolInfo.dart';

class CourseDetails extends StatefulWidget {
  final arguments;
  CourseDetails({this.arguments});
  @override
  State<StatefulWidget> createState() {
    print('my arguments:$arguments');
    return _CourseDetailsState(arguments: arguments);
  }
}

class _CourseDetailsState extends State<CourseDetails> {
  var _arguments;
  var _courseId;
  bool _focued = false;
  final double DEFAULT_BAR = style.topPadding + 35;
  ScrollController _controller = ScrollController();
  double _barOpacity = 0.0;
  _CourseDetailsState({arguments}) {
    this._arguments = arguments;
    this._courseId = arguments['courseId'];
  }

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

  List<Widget> renderBarDown() {
    return <Widget>[
      InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Image.asset('assets/icon/icon-white-back.png'),
      ),
      InkWell(
        onTap: () {
          print('share');
        },
        child: Image.asset('assets/icon/icon-white-share.png'),
      ),
    ];
  }

  List<Widget> renderBarUp() {
    return <Widget>[
      InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Image.asset('assets/icon/icon-dark-back.png'),
      ),
      InkWell(
        onTap: () {
          print('share');
        },
        child: Image.asset('assets/icon/icon-dark-share.png'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: style.bgColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Container(
            width: style.width,
            height: style.height,
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                    controller: _controller,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: style.width,
                            height: 220,
                            child: Image.asset(
                              'assets/icon/banner2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('寒假全期小/初/高数学辅导班',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      this._focued = !this._focued;
                                    });
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      this._focued
                                          ? 'assets/icon/focus-on.png'
                                          : 'assets/icon/unfocus-on.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // 学校信息模块
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                    color: style.borderColor, width: 1),
                              ),
                            ),
                            width: style.width,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('学校信息',
                                            style: TextStyle(fontSize: 14.0)),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text('悦学悦知辅导机构',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text('电话:1xxxxxxxx',
                                            style: TextStyle(fontSize: 14.0)),
                                      ],
                                    ),
                                    ButtonLink(
                                        title: '简介',
                                        handleOnTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext builder) {
                                                return SchoolInfo();
                                              });
                                        }),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(10.0),
                              color: Colors.white,
                              child: InkWell(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      child: Image.asset(
                                        'assets/icon/icon-location.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '东风路东风街道102号',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text('距您1.1千米',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: style.lightGrey))
                                      ],
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          CommentsPanel(),
                          SizedBox(
                            height: 40.0,
                          ),
                        ],
                      ),
                    )),
                // 底部按钮模块
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: style.width,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black12,
                      ),
                    ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '¥59.00',
                              style: TextStyle(
                                  color: style.redColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('日常价:¥165', style: TextStyle(fontSize: 10.0)),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/ConfirmOrder');
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(14.0),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(0, 117, 255, 1),
                                  style.themeColor,
                                ])),
                            child: Text(
                              '立即报名',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                NavBar(
                  barOpacity: 1 - this._barOpacity,
                  barHeight: this.DEFAULT_BAR,
                  color: Colors.transparent,
                  comonent: this.renderBarUp(),
                  shadow: false,
                ),
                NavBar(
                  barOpacity: this._barOpacity,
                  barHeight: this.DEFAULT_BAR,
                  color: Colors.white,
                  comonent: this.renderBarDown(),
                ),
              ],
            ),
          ),
          // 渐变导航栏
        ));
  }
}
