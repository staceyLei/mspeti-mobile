import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/pages/container/CourseDetails/components/DetailsArrange.dart';
import 'package:educationapp/provider/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavBar.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'components/ButtonLink.dart';
import 'components/CommentsPanel.dart';
import 'components/SchoolInfo.dart';

class CourseDetails extends StatefulWidget {
  final arguments;
  CourseDetails({this.arguments});
  @override
  State<StatefulWidget> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  String _courseId;
  CourseM _course;
  bool _focued = false;
  final double DEFAULT_BAR = style.topPadding + 35;
  ScrollController _controller = ScrollController();
  double _barOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _courseId = widget.arguments['courseId'];
    _course = widget.arguments['course'];
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

  String _getPrice() {
    double price = double.parse(_course.coursePrice);
    if (_course.discount != null) {
      price -= double.parse(_course.discount);
    }
    return '¥${price.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    print('detaild change');
    return Scaffold(
        backgroundColor: style.grey,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Container(
            width: style.width,
            height: style.height,
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: style.width,
                        height: style.height * 2 / 5,
                        child: Image.network(
                          _course.courseImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(_course.courseName,
                                style: style.mFontStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: style.titleSize)),
                            Builder(builder: (_) {
                              print('like change');
                              return Consumer<UserProvider>(
                                builder: (_, user, c) {
                                  return InkWell(
                                    onTap: () {
                                      String tips = !user.isCollect(_course)
                                          ? '收藏成功'
                                          : '取消收藏';
                                      user.handleCollect(_course);
                                      Fluttertoast.showToast(
                                          msg: tips,
                                          gravity: ToastGravity.CENTER);
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: Image.asset(
                                        // this._focued
                                        user.isCollect(_course)
                                            ? 'assets/icon/focus-on.png'
                                            : 'assets/icon/unfocus-on.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              );
                            })
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
                            bottom:
                                BorderSide(color: style.borderColor, width: 1),
                          ),
                        ),
                        width: style.width,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('任课老师', style: style.baseFontStyle),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(_course.courseTeacher.teacherName,
                                        style: style.mFontStyle.copyWith(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                ButtonLink(
                                    title: '简介',
                                    handleOnTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext builder) =>
                                              SchoolInfo(
                                                  teacher:
                                                      _course.courseTeacher));
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('开课时间', style: style.baseFontStyle),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                        '${_course.startDate} 至 ${_course.endDate}',
                                        style: style.mFontStyle.copyWith(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                ButtonLink(
                                  title: '详细安排',
                                  handleOnTap: () => showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext builder) =>
                                          DetailsArrange(course: _course)),
                                ),
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
                ),
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
                      children: <Widget>[
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _getPrice(),
                                  style: TextStyle(
                                      color: style.redColor,
                                      fontSize: style.bigFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                if (_course.discount != null)
                                  Text(
                                    '日常价:¥${_course.coursePrice}',
                                    style: style.sFontStyle,
                                  )
                              ],
                            ),
                            flex: 1),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                                    color: style.orangeColor, width: 1.0)),
                            child: Text(
                              '加入购物车',
                              style: style.baseFontStyle
                                  .copyWith(color: style.orangeColor),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/ConfirmOrder', arguments: {
                              'courseList': [_course]
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: style.themeColor, width: 1.0),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Text(
                              '立即报名',
                              style: style.baseFontStyle
                                  .copyWith(color: style.themeColor),
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
