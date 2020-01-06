import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'components/CommentPanel.dart';
import 'components/const.dart';

class CommentDetail extends StatelessWidget {
  List<Widget> renderComment() {
    if (comment.length == 0) {
      return <Widget>[
        Container(
          width: style.width,
          child: Text("暂无评论~"),
        )
      ];
    } else {
      return comment.map((ele) => CommentPanel(
            headImg: ele['headImg'],
            name: ele['name'],
            date: ele['date'],
            star: ele['star'],
            content: ele['content'],
            commentImg: ele['commentImg'],
          )).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          body: Column(
        children: <Widget>[
          Container(
            width: style.width,
            padding: EdgeInsets.fromLTRB(15, style.topPadding, 15, 10),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/icon/arrow-left-black.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("课程评价",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: style.titleSize)),
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: this.renderComment(),
              ),
            ),
          )
        ],
      )),
    );
  }
}
