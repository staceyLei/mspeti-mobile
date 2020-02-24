import 'dart:ui';
import 'package:educationapp/model/Course.dart';
import 'package:educationapp/route/route.dart';
import 'package:educationapp/utils/TimeUtil.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:educationapp/store/store.dart';
import 'package:educationapp/store/modal/User.dart';
import 'package:educationapp/assets/style.dart';
import 'package:educationapp/pages/components/MenuButton.dart';
import 'package:educationapp/pages/components/NavBar.dart';
import 'components/CoursePanel.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'const.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();
  double _t;
  List _hotCourseData = [];
  final double DEFAULT_BAR = MediaQueryData.fromWindow(window).padding.top + 44;

  double _barOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _hotCourseData = MyConst.hotCourseData;
    this._controller.addListener(() {
      _t = this._controller.offset / DEFAULT_BAR;
      setState(() {
        if (this._t >= 1.0) {
          this._barOpacity = 1.0;
        } else if (this._t < 0.0) {
          this._barOpacity = 0.0;
        } else {
          this._barOpacity = this._t;
        }
      });
    });
  }

  List<Widget> renderNavBar() {
    DateTime now = DateTime.now();
    return <Widget>[
      ClipOval(
        child: Image.asset(
          'assets/image/headImg.png',
          fit: BoxFit.cover,
          width: 35,
          height: 35,
        ),
      ),
      SizedBox(width: 20),
      Expanded(
        child: Text(
            '${TimeUtil.getTime(now.hour)}好,今天是${TimeUtil.getWeekDay(now.weekday)}',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        flex: 1,
      )
    ];
  }

  int _menuCount = (MyConst.menuList.length / 4).ceil();

  _itemBuilder(int index) {
    var menuIconBtns = MyConst.menuList
        .map((ele) => MenuButton(
              onPressed: () {
                Navigator.pushNamed(context, ele['url']);
              },
              title: ele['title'],
              image: ele['image'],
            ))
        .toList();
    var start = 0;
    var menuSwiper = [];
    while (start < menuIconBtns.length) {
      var end =
          (start + 4) > menuIconBtns.length ? menuIconBtns.length : start + 4;
      var data = menuIconBtns.sublist(start, end);
      while (data.length < 4) {
        data.add(MenuButton(
          onPressed: null,
          image: Image.asset('assets/image/blank.png', fit: BoxFit.cover),
          title: '',
        ));
      }
      var swiperItem = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: data.map((f) => f).toList(),
      );

      menuSwiper.add(swiperItem);
      start = end;
    }
    return menuSwiper[index];
  }

  List<Widget> courseBox = [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset('assets/icon/title-bar.png'),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '热门课程',
              style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            navigatorKey.currentState.pushNamed('/CourseList');
          },
          child: Row(
            children: <Widget>[
              Text('查看更多',
                  style: style.baseFontStyle.copyWith(color: Colors.blue)),
              SizedBox(
                width: 5,
              ),
              Image.asset('assets/icon/arrow-right-blue.png'),
            ],
          ),
        ),
      ],
    ),
  ];

  List<Widget> _getCoursePanl() {
    var coursePanel = _hotCourseData.map((item) {
      Course course = Course.fromJson(item);
      return CoursePanel(
        course: course,
      );
    }).toList();
    List<Widget> newCourseBox = List.from(this.courseBox);
    newCourseBox.addAll(coursePanel);
    return newCourseBox;
  }

  @override
  Widget build(BuildContext context) {
// 上下边距 （主要用于 刘海  和  内置导航键）
    return StoreConnector<MainState, User>(
      converter: (store) => store.state.user,
      builder: (BuildContext context, User user) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
                backgroundColor: bgColor,
                body: Stack(alignment: Alignment.centerLeft, children: <Widget>[
                  SingleChildScrollView(
                    controller: this._controller,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: style.width / 4 * 3,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: style.width / 16 * 9,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(37, 177, 135, 1),
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(30.0))),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: topPadding + 10),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    ClipOval(
                                      child: Image.asset(
                                        "assets/image/headImg.png",
                                        fit: BoxFit.cover,
                                        width: style.width * 0.16,
                                        height: style.width * 0.16,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text(
                                        'HI ${user.name} ${TimeUtil.getTime(DateTime.now().hour)}好',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // 轮播图
                              Positioned(
                                width: width,
                                height: (style.width - 30) / 2,
                                bottom: 0,
                                child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Swiper(
                                        autoplay: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return new Image.asset(
                                            "assets/image/banner.png",
                                            fit: BoxFit.fill,
                                          );
                                        },
                                        itemCount: 3,
                                        pagination: new SwiperPagination(
                                          builder: DotSwiperPaginationBuilder(
                                            activeColor: Color.fromRGBO(
                                                105, 105, 112, 1),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          width: width,
                          height: (style.width - 150) / 4 + 55,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return this._itemBuilder(index);
                            },
                            itemCount: this._menuCount,
                            pagination: new SwiperPagination(
                              builder: RectSwiperPaginationBuilder(
                                color: Color.fromRGBO(235, 235, 235, 1),
                                activeColor: Color.fromRGBO(105, 105, 112, 1),
                                space: 0.0,
                                size: Size(10, 3),
                                activeSize: Size(10, 3),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: this._getCoursePanl(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  // 渐变导航栏
                  if (this._barOpacity > 0)
                    NavBar(
                      barHeight: this.DEFAULT_BAR,
                      barOpacity: this._barOpacity,
                      comonent: this.renderNavBar(),
                      color: Color.fromRGBO(37, 177, 135, 1),
                    )
                ])));
      },
    );
  }
}
