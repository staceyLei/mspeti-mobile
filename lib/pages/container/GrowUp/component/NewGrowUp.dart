import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'GrowUpItem.dart';

class NewGrowUp extends StatelessWidget {
  final arguments;
  final TextEditingController _controller = TextEditingController();

  NewGrowUp({this.arguments});

  List<Widget> _renderDetails(){
    Map item = arguments['item'];
    return [
      GrowUpItem(
        item: item,
      ),
    ];
  }

  List<Widget> _renderNew(){
    return <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom:
                        BorderSide(color: style.secondFontColor, width: 1))),
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
          SizedBox(height: 15),
          Container(
              width: style.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                InkWell(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: style.secondFontColor, width: 1),
                      ),
                      child: Icon(
                        Icons.videocam,
                        size: 30,
                        color: style.secondFontColor,
                      ),
                    )),
                SizedBox(width: 20),
                InkWell(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: style.secondFontColor, width: 1),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: style.secondFontColor,
                      ),
                    )),
              ]))
        ];
  }

  @override
  Widget build(BuildContext context) {
    bool isNew = arguments['status'] == 0;//0 新增 1 详情
    return NavLayout(
        title: isNew?'创建成长记录':'成长记录详情',
        backgroundColor: Colors.white,
        components: isNew?_renderNew():_renderDetails(),
        bottom: isNew?InkWell(
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
            )):InkWell(
              onTap:(){},
              child:Container(
                padding:EdgeInsets.all(15),
                child:Text('分享',style:style.baseFontStyle.copyWith(fontWeight:FontWeight.bold))
              ),
              
            )
            );
  }
}
