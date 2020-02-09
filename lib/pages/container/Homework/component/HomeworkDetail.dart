import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:flutter/services.dart';

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
        padding: EdgeInsets.symmetric(horizontal:15),
        components: <Widget>[
          SizedBox(height:10),
          Row(
            children: <Widget>[
              Container(
                width: 90,
                height: 90,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(image: AssetImage(item['img']),fit:BoxFit.cover)
                    ),
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
              ]),
              ['1','2'].contains(item['status'])?
              Expanded(
                flex: 1,
                child: 
                SizedBox(
                  width:75,
                  height:75,
                  child:Image.asset(item['status'] == '1'?'assets/icon/homework-wait.png':'assets/icon/homework-success.png',fit: BoxFit.contain,)
                )
                ):SizedBox()
            ],
          ),
          SizedBox(height: 20),
          Text('作业内容',
              style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(item['content'],
              style: style.mFontStyle
                  .copyWith(color: Color.fromRGBO(68, 68, 79, 1))),
          item['status'] == '0'? Container(
            padding: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(color: style.grey,
            borderRadius:BorderRadius.circular(10)),
            height: 200,
            child: TextField(
              controller: _controller,
              inputFormatters: [
              // 字数限制
              LengthLimitingTextInputFormatter(500),
            ],
              decoration: InputDecoration(
                hintText: '请输入...',
                hintStyle: style.hintStyle.copyWith(fontSize: style.mFontSize),
                border: UnderlineInputBorder(
                  borderSide:BorderSide.none
                )
              ),
            )
          ):Container(
            padding:EdgeInsets.all(20),
            width: style.width,
            decoration:BoxDecoration(color: style.grey,
            borderRadius: BorderRadius.circular(10)),
            child: Text(item['homeworkWord'],style: style.mFontStyle,),
          ),
          SizedBox(height: 15),
          item['status'] == '0'?Row(children: [
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
          ]):Row(),
          SizedBox(height:10),
          item['status'] == '2'?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Text('作业得分',
              style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SizedBox(width: style.width,child: Column(
            children:[
               Text(item['grade'],
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 70,color: style.redColor)),
              Container(
                width:115,
                height:26,
                child:Image.asset('assets/icon/homework-grade.png',fit: BoxFit.contain,),
              ),
            ]
          ),),
          SizedBox(height:10),
           Text('教师评语',
              style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
            padding:EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom:15),
            width: style.width,
            decoration:BoxDecoration(color: style.grey,
            borderRadius: BorderRadius.circular(10)),
            child: Text(item['teacherComment'],style: style.mFontStyle,),
          )
            ],
          ):SizedBox()
        ],
        bottom: item['status'] == '0'? InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical:10),
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
            )):null
            );
  }
}
