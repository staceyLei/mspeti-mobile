import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../../assets/style.dart';
import '../../components/MenuButton.dart';
import '../../components/CoursePanel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String _getSayHiString() {}
  static var _menuList = [
    {
      "title": "我的课表",
      "image": Image.asset(
        "assets/icon/menu-class.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
    {
      "title": "课堂作业",
      "image": Image.asset(
        "assets/icon/menu-homework.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
    {
      "title": "课堂考勤",
      "image": Image.asset(
        "assets/icon/menu-attend.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
    {
      "title": "每日阅读",
      "image": Image.asset(
        "assets/icon/menu-reading.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
    {
      "title": "我的成绩",
      "image": Image.asset(
        "assets/icon/menu-result.png",
        fit: BoxFit.fill,
      ),
    },
    {
      "title": "课堂评价",
      "image": Image.asset(
        "assets/icon/menu-remark.png",
        fit: BoxFit.fill,
      ),
      "url": '',
    },
  ];

  int _menuCount = (_menuList.length / 4).ceil();

  _itemBuilder(int index) {
    var menuIconBtns = _menuList
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/icon/title-bar.png'),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '热门课程',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            print('查看更多');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('查看更多',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12.0,
                  )),
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
    const data = [
      {
        'title': '数学趣味课堂',
        'info': '名师教学、保证高分、一对一辅导',
        'courseId': 1,
        'image': 'assets/image/class2.png'
      },
      {
        'title': '美术趣味课堂',
        'info': '名师教学、保证高分、一对一辅导',
        'courseId': 2,
        'image': 'assets/image/class1.png'
      },
    ];
    var coursePanel = data
        .map((f) => CoursePanel(
              title: f['title'],
              image: f['image'],
              courseId: f['courseId'],
              info: f['info'],
            ))
        .toList();
    List<Widget> newCourseBox = List.from(this.courseBox);
    newCourseBox.addAll(coursePanel);
    return newCourseBox;
  }

  @override
  Widget build(BuildContext context) {
// 上下边距 （主要用于 刘海  和  内置导航键）
    double topPadding = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
            body: Container(
                color: bgColor,
                alignment: Alignment.centerLeft,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 260.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 210.0,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(37, 177, 135, 1),
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(50.0))),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: topPadding + 10),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(37, 177, 135, 1),
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(50.0))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    ClipOval(
                                      child: Image.asset(
                                        "assets/image/headImg.png",
                                        fit: BoxFit.cover,
                                        width: 55.0,
                                        height: 55.0,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text(
                                        'HI Mike 早上好',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                width: width,
                                height: 160,
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
                          height: 105,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: this._getCoursePanl(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
