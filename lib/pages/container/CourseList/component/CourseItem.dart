import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CourseItem extends StatelessWidget {
  final Map item;
  final bool layout;
  CourseItem({this.item, this.layout});

  Widget _renderColumn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: style.baseRadius,
                image: DecorationImage(
                    image: AssetImage(item['img']), fit: BoxFit.cover)),
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Expanded(
              flex: 1,
              child: Container(
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item['name'],
                          style: style.baseFontStyle
                              .copyWith(fontSize: style.mFontSize)),
                      Text(item['info'],
                          style: TextStyle(
                              color: style.lightGrey,
                              fontSize: style.baseFontSize)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '¥',
                              style: TextStyle(
                                  color: style.redColor,
                                  fontSize: style.baseFontSize),
                            ),
                            Text(item['price'],
                                style: TextStyle(
                                    color: style.redColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${item['pay']}人付款',
                                style: TextStyle(
                                    color: style.lightGrey,
                                    fontSize: style.baseFontSize)),
                            Text('. . .',
                                style: TextStyle(
                                    color: style.lightGrey,
                                    fontSize: style.baseFontSize)),
                          ]),
                    ]),
              )),
        ],
      ),
    );
  }

  Widget _renderRow() {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      decoration:
          BoxDecoration(borderRadius: style.baseRadius, color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: (style.width - 3 * 15) / 2,
            height: (style.width - 3 * 15) / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                image: DecorationImage(
                    image: AssetImage(item['img']), fit: BoxFit.cover)),
          ),
          SizedBox(height: 5),
          Container(
            width: (style.width - 3 * 15) / 2,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'],
                    maxLines: 2,
                    style: style.baseFontStyle
                        .copyWith(fontSize: style.mFontSize)),
                SizedBox(height: 5),
                Text(item['info'],
                    maxLines: 1,
                    style: TextStyle(
                        color: style.lightGrey, fontSize: style.baseFontSize)),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '¥',
                            style: TextStyle(
                                color: style.redColor,
                                fontSize: style.baseFontSize),
                          ),
                          Text(item['price'],
                              style: TextStyle(
                                  color: style.redColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ]),
                    Text('${item['pay']}人付款',
                        style: TextStyle(
                            color: style.lightGrey,
                            fontSize: style.baseFontSize)),
                  ],
                ),
                
              ],
            ),
          ),
          Container(
            padding:EdgeInsets.only(right: 5.0),
            child:Text('. . .',
                textAlign: TextAlign.right,
              style: TextStyle(
                  color: style.lightGrey, fontSize: style.baseFontSize))
          )
          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/CourseDetails',
              arguments: {"courseId": item['id']});
        },
        child: layout ? _renderRow() : _renderColumn());
  }
}
