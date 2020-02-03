import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'component/const.dart';
import 'component/ClassifyBtn.dart';
import 'component/CourseItem.dart';

class CourseList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CourseListState();
  }
}

class _CourseListState extends State<CourseList> {
  String _selected = "all";
  List<Map> _courseData;

  @override
  void initState() {
    super.initState();
    this._courseData = courseData ?? [];
  }

  List<Widget> _renderTopBtn() {
    return (btnData ?? []).map((item) {
      return ClassifyBtn(
        isActive: item['key'] == _selected,
        onTap: () {
          this.setState(() {
            _selected = item['key'];
          });
        },
        title: item['value'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Column(children: <Widget>[
              Container(
                width: style.width,
                padding: EdgeInsets.fromLTRB(15, style.topPadding + 5, 15, 10),
                color: Colors.white,
                child: Row(children: <Widget>[
                  InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/icon/arrow-left-grey.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width:5),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          print('search');
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          decoration: BoxDecoration(
                            color: style.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 16,
                                height: 16,
                                child: Image.asset(
                                    'assets/icon/course-search.png',
                                    fit: BoxFit.contain),
                              ),
                              SizedBox(width:10),
                              Text('搜索课程', style: style.hintStyle),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            "assets/icon/switch-layout.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                ]),
              ),
              Container(
                  width: style.width,
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: style.grey, width: 0.5),
                  )),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: this._renderTopBtn(),
                    ),
                  )),
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
