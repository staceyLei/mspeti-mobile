import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CoursePanel extends StatefulWidget {
  var title;
  var image;
  var info;
  var courseId;
  CoursePanel(
      {this.title, this.image, this.info, @required this.courseId, Key key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CoursePanelState(
        title: title, image: image, info: info, courseId: courseId);
  }
}

class _CoursePanelState extends State<CoursePanel> {
  var _title;
  var _image;
  var _info;
  var _courseId;
  _CoursePanelState({title, image, info, @required courseId}) {
    this._courseId = courseId;
    this._image = image;
    this._info = info;
    this._title = title;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12, //阴影颜色
            blurRadius: 5.0, //阴影大小
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (style.width - 2 * (10 + 15)) * 0.33,
            height: (style.width - 2 * (10 + 15)) * 0.33,
            decoration: BoxDecoration(
                border: Border.all(
              width: 1.0,
              color: Color.fromRGBO(112, 112, 112, 1),
            )),
            child: Image.asset(
              this._image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: (style.width - 2 * (10 + 15)) * 0.53,
            height: (style.width - 2 * (10 + 15)) * 0.33,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this._title,
                      style: style.mFontStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      this._info,
                      style: style.baseFontStyle.copyWith(color:style.secondFontColor),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/CourseDetails',arguments:{'courseId':1234});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('了解更多',
                          style: style.baseFontStyle.copyWith(color:Colors.blue)),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/icon/arrow-right-blue.png'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
