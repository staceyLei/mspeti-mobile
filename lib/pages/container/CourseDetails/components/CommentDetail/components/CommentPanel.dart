import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import '../../StarBox.dart';

class CommentPanel extends StatelessWidget {
  final String headImg;
  final String name;
  final String date;
  final int star;
  final String content;
  final String commentImg;

  CommentPanel(
      {this.headImg,
      this.name,
      this.date,
      this.star,
      this.content,
      this.commentImg});

  Widget renderCommentImg(String url) {
    if (url.isEmpty) {
      return SizedBox(width: 5.0);
    }
    List<String> imgArr = url.split(',');
    return Container(
      width: style.width,
      padding: EdgeInsets.only(left: 10.0),
      child: Wrap(
        runSpacing: 10.0,
        spacing: 10.0,
        children: imgArr.map((img) {
          return Container(
            width: (style.width - 40) / 3,
            height: (style.width - 40) / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(img,fit: BoxFit.fill,),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: style.baseRadius,
      ),
      child: Column(
        children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: 10.0,
            ),
            ClipOval(
              child: Image.asset(
                this.headImg,
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
                    this.name,
                    style: style.baseFontStyle.copyWith(
                      fontWeight:FontWeight.bold
                    ),
                  ),
                  Text(this.date,
                      style: TextStyle(
                        color: style.lightGrey,
                        fontSize: style.sFontSize,
                      )),
                ],
              ),
            ),
            StarBox(
              star: this.star,
            ),
            SizedBox(
              width: 10.0,
            ),
          ]),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              this.content,
              style: style.baseFontStyle,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          this.renderCommentImg(this.commentImg),
        ],
      ),
    );
  }
}
