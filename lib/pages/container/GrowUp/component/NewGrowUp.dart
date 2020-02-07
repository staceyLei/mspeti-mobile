import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';

class NewGrowUp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return NavLayout(
        title: '创建成长记录',
        backgroundColor: Colors.white,
        components: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border:Border(bottom: BorderSide(color:style.grey,width:1))
                ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 200, maxHeight: 200),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: '请输入成长记录...',
                    hintStyle:
                        style.hintStyle.copyWith(fontSize: style.mFontSize),
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          SizedBox(height:15),
          Container(
            width:style.width,
            padding: EdgeInsets.symmetric(horizontal:10),
            child:Row(children: [
            InkWell(
                onTap: () {},
                child: Container(
                  width: 60,
                  height:60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: style.lightGrey, width: 1),
                  ),
                  child: Icon(
                    Icons.videocam,
                    size: 30,
                    color: style.lightGrey,
                  ),
                )),
                SizedBox(width:20),
            InkWell(
                onTap: () {},
                child: Container(
                  width: 60,
                  alignment: Alignment.center,
                  height:60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: style.lightGrey, width: 1),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 25,
                    color: style.lightGrey,
                  ),
                )),
          ])
          )
        ],
        bottom: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              width: style.width - 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(0, 117, 255, 1),
                    style.themeColor,
                  ])),
              child: Text('提交作业',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: style.titleSize,
                  )),
            )));
  }
}
