import 'package:educationapp/model/HomeworkM.dart';
import 'package:educationapp/pages/components/MediaButton.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:flutter/services.dart';
import 'package:educationapp/pages/components/VideoItem.dart';

class HomeworkDetail extends StatelessWidget {
  final arguments;
  final TextEditingController _controller = TextEditingController();
  HomeworkM _homework;

  HomeworkDetail({this.arguments}) {
    _homework = arguments['details'];
  }

  List<Widget> _renderHomeworkDetail() {
    List<Widget> res = [
      if(_homework.pubVideo!=null&&_homework.pubVideo!='')
      VideoItem(video: _homework.pubVideo),
    ];
    List imgArr = _homework.pubImg.split(",");
    res.addAll(imgArr.map((ele) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
            width: 75, height: 75, child: Image.network(ele, fit: BoxFit.cover)),
      );
    }));
    return res;
  }

  String _getFormatDate(String date) {
    return date.split(',').join('-');
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
        title: '作业详情',
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        components: <Widget>[
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: style.baseRadius,
                  child: Image.network(_homework.courseImg,
                      width: 90, height: 90, fit: BoxFit.cover)),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(_homework.courseName,
                    style: TextStyle(
                        color: style.baseFontColor,
                        fontSize: style.titleSize,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('发布者：${_homework.courseTeacher.teacherName}', style: style.mFontStyle),
                SizedBox(height: 10),
                Text(_getFormatDate(_homework.pubDate),
                    style: style.mFontStyle.copyWith(
                        color: style.lightGrey, fontWeight: FontWeight.bold)),
              ]),
              if (['1', '2'].contains(_homework.status))
                Expanded(
                    flex: 1,
                    child: SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset(
                          _homework.status == '1'
                              ? 'assets/icon/homework-wait.png'
                              : 'assets/icon/homework-success.png',
                          fit: BoxFit.contain,
                        )))
            ],
          ),
          SizedBox(height: 20),
          Text('作业内容',
              style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(_homework.homeworkContent,
              style: style.mFontStyle.copyWith(color: style.blueBlack)),
          _homework.status == '0'
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: style.grey,
                      borderRadius: BorderRadius.circular(10)),
                  height: 200,
                  child: TextField(
                    controller: _controller,
                    inputFormatters: [
                      // 字数限制
                      LengthLimitingTextInputFormatter(500),
                    ],
                    decoration: InputDecoration(
                        hintText: '请输入...',
                        hintStyle:
                            style.hintStyle.copyWith(fontSize: style.mFontSize),
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                  ))
              : Container(
                  padding: EdgeInsets.all(20),
                  width: style.width,
                  decoration: BoxDecoration(
                      color: style.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    _homework.pubContent,
                    style: style.mFontStyle,
                  ),
                ),
          SizedBox(height: 15),
          _homework.status == '0'
              ? Row(children: [
                  MediaButton(isCamera: false),
                  SizedBox(width: 20),
                  MediaButton(isCamera: true),
                ])
              : Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _renderHomeworkDetail(),
                ),
          SizedBox(height: 10),
          if (_homework.status == '2')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('作业得分',
                    style:
                        style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                SizedBox(
                  width: style.width,
                  child: Column(children: [
                    Text(_homework.homeworkGrade,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                            color: style.redColor)),
                    Container(
                      width: 115,
                      height: 26,
                      child: Image.asset(
                        'assets/icon/homework-grade.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 10),
                Text('教师评语',
                    style:
                        style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 15),
                  width: style.width,
                  decoration: BoxDecoration(
                      color: style.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    _homework.teacherComment,
                    style: style.mFontStyle,
                  ),
                )
              ],
            )
        ],
        bottom: _homework.status == '0'
            ? InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: style.width - 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: style.baseGradient),
                  child: Text('提交作业',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: style.titleSize,
                      )),
                ))
            : null);
  }
}
