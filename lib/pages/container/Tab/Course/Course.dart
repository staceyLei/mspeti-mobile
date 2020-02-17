import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'component/const.dart';
import 'component/ClassifyBtn.dart';
import 'component/CourseItem.dart';

class Course extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CourseState();
  }
}

class _CourseState extends State<Course> {
  List<Map> _courseData;

  @override
  void initState() {
    super.initState();
    this._courseData = courseData ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        // drawer: Drawer(),
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Column(children: <Widget>[
              Container(
                width: style.width,
                padding: EdgeInsets.fromLTRB(15, style.topPadding + 5, 15, 10),
                decoration: BoxDecoration(
                  border: Border(
                              bottom:BorderSide(color: style.borderColor,width:0.5)
                            ),
                color: Colors.white,
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          navigatorKey.currentState.pushNamed('/SearchPage',arguments: {'from':'course'});
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          decoration: BoxDecoration(
                            color: style.grey,
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('搜索课程', style: style.hintStyle),
                              Container(
                                width: 16,
                                height: 16,
                                child: Image.asset(
                                    'assets/icon/course-search.png',
                                    fit: BoxFit.contain),
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                      onTap: () {
                        print('fenlei');
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: style.grey),
                        child: Text(
                          '分类',
                          style: TextStyle(
                            fontSize: style.mFontSize,
                            fontWeight: FontWeight.bold,
                            color: style.lightGrey,
                          ),
                        ),
                      ))
                ]),
              ),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                      padding: EdgeInsets.only(top:10),
                      itemCount: _courseData.length,
                      itemBuilder: (context, index) {
                        return CourseItem(item: _courseData[index]);
                      }))
            ])),
      ),
    );
  }
}
