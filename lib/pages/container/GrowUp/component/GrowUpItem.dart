import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/VideoItem.dart';

class GrowUpItem extends StatefulWidget {
  final Map item;
  final Function itemFunc;
  GrowUpItem({this.item,this.itemFunc});

  @override
  State<GrowUpItem> createState() {
    return _GrowUpItemState();
  }
}

class _GrowUpItemState extends State<GrowUpItem> {
  List<Widget> _renderGrowUpDetail() {
    List<Widget> res = [
      VideoItem(video: widget.item['video']),
    ];
    List imgArr = widget.item['img'].split(",");
    res.addAll(imgArr.map((ele) {
      return InkWell(
        onTap: widget.itemFunc,
        child:ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
            width: 75, height: 75, child: Image.asset(ele, fit: BoxFit.cover)),
      )
    )
      ;
    }));
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      width: style.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  widget.item['headImg'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  widget.item['name'],
                  style: style.mFontStyle,
                  maxLines: 2,
                ),
                Text(widget.item['time'],
                    style: style.sFontStyle.copyWith(color: style.lightGrey))
              ]),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 60),
              width: style.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.item['content'], style: style.baseFontStyle),
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
  }
}
