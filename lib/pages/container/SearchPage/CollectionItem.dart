import 'package:educationapp/model/CourseM.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CollectionItem extends StatelessWidget {
  final CourseM item;
  CollectionItem({@required this.item});

  Widget _renderColumn() {
    double itemH = style.width / 3;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius:style.baseRadius,
            child:Image.network(item.courseImg,width:itemH,height:itemH,fit:BoxFit.cover)
          ),
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left:10),
                height: itemH,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(item.courseName,
                                maxLines: 2,
                                style: style.baseFontStyle
                                    .copyWith(fontSize: style.mFontSize)),
                            SizedBox(height: 10),
                            Text(item.courseInfo,
                                maxLines: 1,
                                style: TextStyle(
                                    color: style.lightGrey,
                                    fontSize: style.baseFontSize)),
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '¥',
                              style: TextStyle(
                                  color: style.redColor,
                                  fontSize: style.baseFontSize),
                            ),
                            Text(item.coursePrice,
                                style: TextStyle(
                                    color: style.redColor,
                                    fontSize: style.bigFontSize,
                                    fontWeight: FontWeight.bold)),
                          ])
                    ]),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/CourseDetails', arguments: {'courseId': item.courseId,'course':item});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(bottom: 10),
        width: style.width,
        child: _renderColumn(),
      ),
    );
  }
}
