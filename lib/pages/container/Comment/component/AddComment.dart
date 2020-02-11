import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';

class AddComment extends StatefulWidget {
  final arguments;

  AddComment({this.arguments});
  @override
  State<AddComment> createState() {
    return _AddCommentState();
  }
}

class _AddCommentState extends State<AddComment> {
  Map _item;
  int _star = 0;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _item = widget.arguments['data'];
  }

  Widget _renderStar(bool isActive, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _star = index + 1;
          });
        },
        child: Container(
          width: 30,
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 30,
          child: Image.asset(
            isActive
                ? 'assets/icon/commentStar-active.png'
                : 'assets/icon/commentStar-unactive.png',
            fit: BoxFit.contain,
          ),
        ));
  }

  List<Widget> _renderStarBox(int star) {
    List<Widget> res = [];
    int index = 0;
    while (res.length < star) {
      res.add(_renderStar(true, index));
      index++;
    }
    while (res.length < 5) {
      res.add(_renderStar(false, index));
      index++;
    }
    return res;
  }

  Widget _renderBottom() {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          width: style.width - 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: style.baseGradient),
          child: Text('提交点评',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: style.titleSize,
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        title: '添加点评',
        bottom: _renderBottom(),
        components: [
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            ClipOval(
              child: Image.asset(
                _item['headImg'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_item['teacher'],
                        style: style.baseFontStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(_item['course'], style: style.mFontStyle)
                  ],
                )),
            Text('2020年3月5日', style: style.mFontStyle),
          ]),
          SizedBox(height: 20),
          Text('给Ta评个分吧',
              style: style.mFontStyle.copyWith(
                  fontSize: style.titleSize, fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(15),
            width: style.width,
            decoration: BoxDecoration(
                border: Border.all(color: style.themeColor, width: 1.0),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _renderStarBox(_star)),
          ),
          SizedBox(height: 15),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: style.grey),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 200,
                ),
                child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: '给Ta点评...',
                        hintStyle: style.hintStyle
                            .copyWith(fontSize: style.mFontSize))),
              ))
        ]);
  }
}
