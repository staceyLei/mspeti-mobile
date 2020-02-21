import 'package:educationapp/pages/components/MediaButton.dart';
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
  bool _isTeacher; //点评老师/课堂
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _item = widget.arguments['data'];
    _isTeacher = widget.arguments['isTeacher'];
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

  String _getNowDate() {
    DateTime now = DateTime.now();
    return '${now.year}年${now.month}月${now.day}日';
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        title: '添加点评',
        bottom: _renderBottom(),
        components: [
          Row(crossAxisAlignment: _isTeacher? CrossAxisAlignment.end:CrossAxisAlignment.start, children: [
            _isTeacher?
            ClipOval(
              child: Image.asset(
                _item['img'],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ):
            ClipRRect(
              borderRadius:style.baseRadius,
              child: Image.asset(
                _item['img'],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )
            ),
            SizedBox(width: 15),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_isTeacher? _item['teacher']:_item['course'],
                        style: style.baseFontStyle.copyWith(
                            fontSize: style.bigFontSize, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    if(_isTeacher)
                    Text(_item['course'], style: style.mFontStyle)
                    else
                    Text(_getNowDate(), style: style.mFontStyle),
                  ],
                )),
                if(_isTeacher)
            Text(_getNowDate(), style: style.mFontStyle),
          ]),
          SizedBox(height: 20),
          Text('给Ta评个分吧',
              style: style.mFontStyle.copyWith(
                  fontSize: style.titleSize, fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(top:15),
            width: style.width,
            decoration: BoxDecoration(
                border: Border.all(color: style.themeColor, width: 1.0),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _renderStarBox(_star)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical:15),
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
              )),
              if(!_isTeacher) MediaButton(isCamera:true)
        ]);
  }
}
