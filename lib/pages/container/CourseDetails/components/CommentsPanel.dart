import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'ButtonLink.dart';
import 'const.dart';
import 'StarBox.dart';

class CommentsPanel extends StatelessWidget {
  List<Widget> renderContent(List data) {
    List<Widget> contents = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('全网评价', style: TextStyle(fontSize: 12.0)),
          ButtonLink(
            title: '更多',
            handleOnTap: () {
              print('more');
              navigatorKey.currentState.pushNamed('/CourseComment');
            },
          ),
        ],
      ),
      SizedBox(
        height: 10.0,
      ),
    ];
    List<Widget> commentData = data
        .map((ele) => Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: style.bgColor,
                borderRadius: style.baseRadius,
              ),
              child: Column(
                children: <Widget>[
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    ClipOval(
                      child: Image.asset(
                        ele['headImg'],
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${ele['name']}',
                            style: style.baseFontStyle.copyWith(fontWeight:FontWeight.bold),
                          ),
                          Text('${ele['date']}',
                              style: TextStyle(
                                color: style.lightGrey,
                                fontSize: style.sFontSize,
                              )),
                        ],
                      ),
                    ),
                    StarBox(
                      star: ele['star'],
                    )
                  ]),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      ele['content'],
                      style: TextStyle(
                          color: style.baseFontColor, fontSize: style.sFontSize),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
    if (commentData.length > 0) {
      contents.addAll(commentData);
    } else {
      contents.add(Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("暂无评论~", style: TextStyle(fontSize: 22.0)),
            ],
          )));
    }
    return contents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      width: style.width,
      child: Column(
        children: this.renderContent(comment),
      ),
    );
  }
}
