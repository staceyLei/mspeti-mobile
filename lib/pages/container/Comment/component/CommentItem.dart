import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CommentItem extends StatelessWidget {
  final Map item;
  final bool isSend;
  CommentItem({this.item, this.isSend});

  Widget _renderStar(bool isActive) {
    return Container(
      width: 25,
      margin: EdgeInsets.symmetric(horizontal: 2.5),
      height: 25,
      child: Image.asset(
        isActive
            ? 'assets/icon/commentStar-active.png'
            : 'assets/icon/commentStar-unactive.png',
        fit: BoxFit.contain,
      ),
    );
  }

  List<Widget> _renderStarBox(String star) {
    int stars = int.parse(star);
    List<Widget> res = [];
    while (res.length < stars) {
      res.add(_renderStar(true));
    }
    while (res.length < 5) {
      res.add(_renderStar(false));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: Column(children: [
        Row(
          children: <Widget>[
            ClipOval(
              child: Image.asset(item['headImg'],
                  fit: BoxFit.contain, width: 50, height: 50),
            ),
            SizedBox(width: 10),
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          !isSend
                              ? item['commentName']
                              : 'To:${item['commentName']}',
                          style: style.mFontStyle.copyWith(
                              fontSize: style.titleSize,
                              fontWeight: FontWeight.bold)),
                      Text('${item['commentCourse']} ${item['commentTime']}',
                          style: style.baseFontStyle)
                    ])),
            !isSend
                ? InkWell(
                    onTap: () {
                      navigatorKey.currentState
                          .pushNamed('/AddComment', arguments: {
                        'data': {
                          "teacher": item['commentName'],
                          "course": item['commentCourse'],
                          "headImg": item['headImg']
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: style.themeColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Text('评价',
                          style: style.secondFontStyle.copyWith(
                              color: style.themeColor,
                              fontWeight: FontWeight.bold)),
                    ))
                : SizedBox()
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _renderStarBox(item['commentStar'])),
            SizedBox(height:15),
        Container(
          padding: EdgeInsets.all(15),
          color: style.grey,
          child: Text(item['commentContent'],
              style: style.baseFontStyle.copyWith(fontWeight: FontWeight.bold)),
        )
      ]),
    );
  }
}
