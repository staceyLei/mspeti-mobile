import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CollectionItem extends StatelessWidget {
  final Map item;
  CollectionItem({@required this.item});

  Widget _renderColumn() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: style.baseRadius,
                image: DecorationImage(
                    image: AssetImage(item['img']), fit: BoxFit.cover)),
            width: 120,
            height: 120,
          ),
          SizedBox(width: 10),
          Expanded(
              flex: 1,
              child: Container(
                height: 120,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(item['name'],
                                maxLines: 2,
                                style: style.baseFontStyle
                                    .copyWith(fontSize: style.mFontSize)),
                            SizedBox(height: 10),
                            Text(item['info'],
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
                            Text(item['price'],
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
            .pushNamed('/CourseDetails', arguments: {'courseId': item['id']});
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
