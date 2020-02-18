import 'package:educationapp/const.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/components/BaseLayout.dart';
import 'package:educationapp/assets/style.dart' as style;

class TimeTableDetail extends StatefulWidget {
  final arguments;
  TimeTableDetail({this.arguments});
  @override
  State<TimeTableDetail> createState() {
    return _TimeTableDetailState();
  }
}

class _TimeTableDetailState extends State<TimeTableDetail> {
  Map _item;
  int _selectStatus; //0正常 1到课 2请假 3审核 4缺勤

  @override
  void initState() {
    super.initState();
    _item = widget.arguments['courseInfo'];
    _selectStatus = int.parse(_item['status']);
  }

  Widget _renderInfoItem(String title, String info) => Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border:
                Border(bottom: BorderSide(color: style.borderColor, width: 1))),
        child: Row(
          children: <Widget>[
            Text(title, style: style.mFontStyle),
            SizedBox(width: 15),
            Text(info,
                style: style.mFontStyle.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      );

  Widget _renderBtn(String title, String btn) {
    return InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: style.blueBlack,
                  borderRadius: BorderRadius.circular(25)),
              child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    btn,
                    fit: BoxFit.contain,
                  )),
            ),
            SizedBox(height: 5),
            Text(title, style: style.mFontStyle)
          ],
        ));
  }

  String _getStatus(int status) {
    List<String> statusImg = [
      '',
      'assets/icon/arrive-class.png',
      'assets/icon/qingjia.png',
      'assets/icon/wait-for-check.png',
      'assets/icon/out-of-class.png',
    ];
    return statusImg[status];
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: '课表详情',
        backgroundColor: Colors.white,
        componentMargin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
        components: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
          child: Stack(alignment: Alignment.center, children: [
            Opacity(
                opacity: 0.05,
                child: Container(
                    width: style.width - 50,
                    child:
                        Image.asset(_item['courseImg'], fit: BoxFit.fitWidth))),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _item['courseName'],
                        style: style.mFontStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Container(
                          width: 70,
                          height: 70,
                          child:( _selectStatus == TimeTableStatus.normal.index)
                              ? SizedBox()
                              : Image.asset(
                                  _getStatus(_selectStatus),
                                  fit: BoxFit.contain,
                                ))
                    ],
                  ),
                ),
                _renderInfoItem('授课老师', _item['courseTeacher']),
                _renderInfoItem('课程日期', _item['date']),
                _renderInfoItem(
                    '上课时间', '${_item['startTime']} 至 ${_item['endTime']}'),
                _renderInfoItem('课程学时', _item['courseHours']),
                SizedBox(height: 40),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _renderBtn('请假', 'assets/icon/ask-for-leave.png'),
                      _renderBtn('到课', 'assets/icon/has-class.png')
                    ])
              ],
            )
          ]),
        ));
  }
}
