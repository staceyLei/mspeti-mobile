import 'package:educationapp/model/HomeworkM.dart';
import 'package:educationapp/pages/components/DatePicker.dart';
import 'package:educationapp/provider/HomeworkProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/BaseLayout.dart';
import 'package:provider/provider.dart';
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
  List<HomeworkM> _homeworkData;
  List<HomeworkM> _renderData;
  String _checkStatus = 'all';
  int _selectYear;
  int _selectMonth;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() {
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
        {'key': '0', 'title': '未提交', 'number': "${_getNumber('0')}"},
        {'key': '1', 'title': '待评改', 'number': "${_getNumber('1')}"},
        {'key': '2', 'title': '已完成', 'number': "${_getNumber('2')}"},
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
                    .where((ele) => ele.status == newStatus)
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

  int _getNumber(String value) {
    return _homeworkData.where((item) {
      return item.status == value;
    }).length;
  }

  Widget _renderContent(buildContext, index) {
    // Map item = _renderData[index];
    // HomeworkM homework = HomeworkM.fromJson(item);
    HomeworkM homework = _renderData[index];
    return InkWell(
        onTap: () {
          navigatorKey.currentState
              .pushNamed('/HomeworkDetail', arguments: {'details': homework});
        },
        child: HomeworkPanel(homework: homework));
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
            child: Consumer<HomeworkProvider>(
              builder: (context, homework, _) {
                _homeworkData = homework.searchHomework(
                    _selectYear.toString(), _selectMonth.toString());
                _renderData = _homeworkData;
                return Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                if (_selectMonth > 0)
                                  Text(
                                      _selectMonth < 10
                                          ? '0$_selectMonth'
                                          : _selectMonth.toString(),
                                      style: style.baseFontStyle.copyWith(
                                          fontSize: style.titleSize,
                                          fontWeight: FontWeight.bold)),
                                if (_selectMonth > 0)
                                  Text('月', style: style.sFontStyle),
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
                                      width: 150,
                                      margin: EdgeInsets.only(bottom:15),
                                      child: Image.asset(
                                        'assets/icon/icon-none.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Text('暂无作业',
                                        style: style.mFontStyle),
                                  ])
                            : ListView.builder(
                                itemCount: _renderData.length,
                                padding: EdgeInsets.only(top: 10),
                                itemBuilder: this._renderContent))
                  ],
                );
              },
            )));
  }
}
