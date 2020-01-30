import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'package:educationapp/route/route.dart';
import 'const.dart';

class SelectSchool extends StatefulWidget {
  @override
  State<SelectSchool> createState() {
    return _SelectSchoolState();
  }
}

class _SelectSchoolState extends State<SelectSchool> {
  List<Map<String, String>> arr;
  bool status = true; //true为展示状态；false为搜索状态
  @override
  void initState() {
    super.initState();
    arr = schoolData;
  }

  Widget renderList(List data) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: data.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              navigatorKey.currentState.pushNamed('/Login',
                  arguments: {"school": data[index]});
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: style.borderColor, width: 1.0),
              )),
              child: Text(data[index]['name'],
                  style: TextStyle(
                      color: style.sFontColor, fontSize: style.baseFontSize)),
            ));
      },
    );
  }

  Widget renderShow() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: style.topPadding,
        ),
        Container(
          child: Text('选择机构',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: style.titleSize,
                color: style.baseFontColor,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: style.bgColor, width: 10))),
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: style.bgGrey,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 20.0,
                ),
                child: InkWell(
                  onTap: () {
                    this.setState(() {
                      this.status = false;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 16,
                        height: 16,
                        child: Image.asset("assets/icon/search.png",fit: BoxFit.fitHeight,),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text("搜索机构", style: style.hintStyle),
                    ],
                  ),
                ),
              )),
        ),
        Expanded(
          flex: 1,
          child: this.renderList(this.arr),
        )
      ],
    );
  }

  Widget renderSearch() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: style.topPadding,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: style.bgGrey,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 20.0,
                      ),
                      child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              prefixIcon: Container(
                                width: 16,
                                height: 16,
                                padding: EdgeInsets.all(2.5),
                                child: Image.asset("assets/icon/search.png"),
                              ),
                              hintText: '搜索机构',
                              hintStyle: style.hintStyle,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ))),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () {
                  this.setState(() {
                    this.status = true;
                  });
                },
                child: Text('取消', style: TextStyle(color: Colors.green)),
              ),
            )
          ],
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: style.bgColor,
            child: this.renderList([]),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: this.status ? this.renderShow() : this.renderSearch(),
    );
  }
}
