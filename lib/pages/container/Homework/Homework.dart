import 'package:educationapp/pages/components/DatePicker.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/BaseLayout.dart';
import 'component/const.dart';
import 'component/HomeworkItem.dart';
import 'component/HomeworkPanel.dart';

class Homework extends StatefulWidget {
  @override
  State<Homework> createState() {
    return _HomeworkState();
  }
}

class _HomeworkState extends State<Homework> {
  List _homeworkData;
  List _renderData;
  String _checkStatus = 'all';
  int _selectYear;
  int _selectMonth;
  @override
  void initState() {
    super.initState();
    _homeworkData = homeworkData;
    _renderData = _homeworkData;
    DateTime now = DateTime.now();
    _selectYear = now.year;
    _selectMonth = now.month;
  }

  Widget _renderCount() {
    List count = [];
    if (_homeworkData.isEmpty) {
      count = [
        {'key': 'all', 'title': '全部', 'number': '0'},
        {'key': '0', 'title': '未提交', 'number': '0'},
        {'key': '1', 'title': '待评改', 'number': '0'},
        {'key': '2', 'title': '已完成', 'number': '0'},
      ];
    } else {
      count = [
        {'key': 'all', 'title': '全部', 'number': '${_homeworkData.length}'},
        {'key': '0', 'title': '未提交', 'number': "${_getNumber('status', '0')}"},
        {'key': '1', 'title': '待评改', 'number': "${_getNumber('status', '1')}"},
        {'key': '2', 'title': '已完成', 'number': "${_getNumber('status', '2')}"},
      ];
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: count.map((item) {
          bool isChecked = item['key'] == _checkStatus;
          return InkWell(
            onTap: () {
              this.setState(() {
                String newStatus = item['key'];
                _checkStatus = newStatus;
                List newData = _homeworkData
                    .where((ele) => ele['status'] == newStatus)
                    .toList();
                _renderData = newStatus == 'all' ? _homeworkData : newData;
              });
            },
            child: HomeworkItem(
              isChecked: isChecked,
              number: item['number'],
              title: item['title'],
            ),
          );
        }).toList());
  }

  int _getNumber(String key, String value) {
    return _homeworkData.where((item) {
      return item[key] == value;
    }).length;
  }

  Widget _renderContent(buildContext, index) {
    Map item = _renderData[index];
    return InkWell(
        onTap: () {
          navigatorKey.currentState
              .pushNamed('/HomeworkDetail', arguments: {'details': item});
        },
        child: HomeworkPanel(
            title: item['title'],
            course: item['course'],
            time: item['time'],
            status: item['status']));
  }

  _handleOnOk(int year, int month) {
    setState(() {
      _selectYear = year;
      _selectMonth = month;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: '我的作业',
        backgroundColor: Colors.white,
        components: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('作业概况',
                    style: style.baseFontStyle.copyWith(
                        fontSize: style.titleSize,
                        fontWeight: FontWeight.bold)),
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) => DatePicker(
                                selectM: _selectMonth,
                                selectY: _selectYear,
                                handleOnOK: _handleOnOk,
                              ));
                    },
                    child: Row(children: [
                      Text(_selectYear.toString(),
                          style: style.baseFontStyle.copyWith(
                              fontSize: style.titleSize,
                              fontWeight: FontWeight.bold)),
                      Text('年', style: style.sFontStyle),
                      if(_selectMonth>0)
                      Text(_selectMonth < 10
                                  ? '0$_selectMonth'
                                  : _selectMonth.toString(),
                          style: style.baseFontStyle.copyWith(
                              fontSize: style.titleSize,
                              fontWeight: FontWeight.bold)),
                      if (_selectMonth > 0) Text('月', style: style.sFontStyle),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 18,
                        color: style.baseFontColor,
                      )
                    ])),
              ]),
              SizedBox(height: 15),
              this._renderCount(),
              SizedBox(height: 5),
              Expanded(
                  flex: 1,
                  child: _homeworkData.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Container(
                                width: 90,
                                height: 90,
                                child: Image.asset(
                                  'assets/icon/homework-none.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text('暂无作业',
                                  style: style.secondFontStyle.copyWith(
                                      fontSize: 20, color: style.lightGrey)),
                            ])
                      : ListView.builder(
                          itemCount: _renderData.length,
                          padding: EdgeInsets.only(top: 10),
                          itemBuilder: this._renderContent))
            ],
          ),
        ));
  }
}
