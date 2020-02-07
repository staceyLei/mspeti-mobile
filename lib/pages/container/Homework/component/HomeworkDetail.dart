import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';

class HomeworkDetail extends StatelessWidget {

  final arguments;
  final TextEditingController _controller = TextEditingController();

  HomeworkDetail({this.arguments});
  @override
  Widget build(BuildContext context) {
    Map item = arguments['details'];
    return NavLayout(
        title: '作业详情',
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(15),
        components: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 90,
                height: 90,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Image.asset(item['img'], fit: BoxFit.cover),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                Text(item['course'],
                    style: TextStyle(
                        color: style.baseFontColor,
                        fontSize: style.titleSize,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('发布者：${item['teacher']}', style: style.mFontStyle),
                SizedBox(height: 10),
                Text(item['time'],
                    style: style.mFontStyle.copyWith(
                        color: style.lightGrey, fontWeight: FontWeight.bold)),
              ])
            ],
          ),
          SizedBox(height: 20),
          Text('作业内容',
              style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(item['content'],
              style: style.mFontStyle
                  .copyWith(color: Color.fromRGBO(68, 68, 79, 1))),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(color: style.grey,
            borderRadius:BorderRadius.circular(10)),
            child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 200,
              maxHeight: 200
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '请输入...',
                hintStyle: style.hintStyle.copyWith(fontSize: style.mFontSize),
                border: UnderlineInputBorder(
                  borderSide:BorderSide.none
                )
              ),
            ),
          ),
          ),
          SizedBox(height: 15),
          Row(children: [
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
        ],
        bottom: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom:10),
              width: style.width-100,
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
