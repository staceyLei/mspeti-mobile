import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'components/ButtonLink.dart';
import 'components/CommentsPanel.dart';

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
  _CourseDetailsState({arguments}) {
    this._arguments = arguments;
    this._courseId = arguments['courseId'];
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
                  child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(10, style.topPadding, 10, 10),
                      width: style.width,
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon/banner2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                      child: Opacity(
                        opacity: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child:
                                  Image.asset('assets/icon/icon-dark-back.png'),
                            ),
                            InkWell(
                              onTap: () {
                                print('share');
                              },
                              child: Image.asset(
                                  'assets/icon/icon-dark-share.png'),
                            ),
                          ],
                        ),
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
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
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
                          bottom:
                              BorderSide(color: style.borderColor, width: 1),
                        ),
                      ),
                      width: style.width,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              ButtonLink(title: '简介',),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(height: 10.0,),
                        CommentsPanel(),
                        SizedBox(height: 10.0,),
                  ],
                ),
              )),
              // 底部按钮模块
              Positioned(
                bottom: 0,
                child: Container(
                  width: style.width,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black12,
                      ),
                    ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '￥59.00',
                            style: TextStyle(
                                color: style.redColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('日常价:￥165', style: TextStyle(fontSize: 10.0)),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          print('免费预约');
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Text('免费预约',style: TextStyle(color: Colors.white,fontSize: 12.0),),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          ),
          
        ));
  }
}
