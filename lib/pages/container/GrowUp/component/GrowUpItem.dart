import 'dart:io';

import 'package:educationapp/model/GrowUpM.dart';
import 'package:educationapp/pages/components/Skeleton.dart';
import 'package:educationapp/provider/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/VideoItem.dart';
import 'package:provider/provider.dart';

class GrowUpItem extends StatefulWidget {
  final GrowUpM item;
  final Function itemFunc;
  final Function videoFunc;
  GrowUpItem({this.item, this.itemFunc, this.videoFunc});

  @override
  State<GrowUpItem> createState() {
    return _GrowUpItemState();
  }
}

class _GrowUpItemState extends State<GrowUpItem> {
  List<Widget> _renderGrowUpDetail() {
    List<Widget> res = [
      if (widget.item.pubVideo != null&& widget.item.pubVideo!='')
        GestureDetector(
          onTap: widget.videoFunc,
          child: VideoItem(video: widget.item.pubVideo),
        )
    ];
    List<String> imgArr = widget.item.pubImg.isNotEmpty? widget.item.pubImg.split(","):[];
    res.addAll(imgArr.map((ele) {
      return InkWell(
          onTap: widget.itemFunc,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(width: 75, height: 75, child: _getImageItem(ele)),
          ));
    }));
    return res;
  }

  _getImageItem(String url) {
    if (url.contains('http')) {
      return Image.network(url, fit: BoxFit.cover);
    } else {
      File image = File(
          url);
      return Image.file(image, fit: BoxFit.cover);
    }
  }

  String _getTimeFormat(String date) {
    List<int> d = date.split(',').map((e) => int.parse(e)).toList();
    List<String> dateFormat = DateTime(d[0], d[1], d[2], d[3], d[4], d[5])
        .toLocal()
        .toString()
        .split('.');
    return dateFormat[0];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, _) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 10),
          color: Colors.white,
          width: style.width,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Skeleton(img: user.student.studentImg, size: 50),
                  SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.student.studentName,
                          style: style.mFontStyle,
                          maxLines: 2,
                        ),
                        Text(_getTimeFormat(widget.item.pubDate),
                            style: style.sFontStyle
                                .copyWith(color: style.lightGrey))
                      ]),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 60),
                  width: style.width - 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.item.pubWord, style: style.baseFontStyle),
                      SizedBox(height: 15),
                      Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: _renderGrowUpDetail())
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}
