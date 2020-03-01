import 'package:educationapp/model/CourseTable.dart';
import 'package:educationapp/provider/CourseTableProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/components/Calender.dart';
import 'package:educationapp/pages/components/BaseLayout.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:provider/provider.dart';
import 'const.dart';
import 'component/TimeTableItem.dart';

class TimeTable extends StatefulWidget {
  @override
  State<TimeTable> createState() {
    return _TimeTableState();
  }
}

class _TimeTableState extends State<TimeTable> {
  List<CourseTable> _classData = []; //该月所有课程
  List<CourseTable> _showData = []; //选中日的课程
  bool _loading = false; //切换月份时候加载
  DateTime _now;
  String _selectYear;
  String _selectMonth;
  String _selectDay;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _selectYear = _now.year.toString();
    _selectMonth = _now.month.toString();
    _selectDay = _now.day.toString();
  }

  Widget _renderEmpty() {
    return Container(
        color: Colors.white,
        width: style.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 110,
            margin: EdgeInsets.only(bottom: 15),
            child: Image.asset(
              'assets/icon/icon-none.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Text('今天没有课噢，预习一下别的课程吧~', style: style.mFontStyle),
        ]));
  }

  // _handleOnChangeDay(int selectedDay) {
  //   setState(() {
  //     _showData = _classData.where((item) {
  //       // CourseTable courseTable = CourseTable.fromJson(item);
  //       List<String> _dateArr = item.courseDate.split(',');
  //       return _dateArr[2] == selectedDay.toString();
  //     }).toList();
  //   });
  // }

  // 设置选中日的课程列表数据
  _setShowData() {
    _showData = _classData.where((item) {
      // CourseTable courseTable = CourseTable.fromJson(item);
      List<String> _dateArr = item.courseDate.split(',');
      return _dateArr[2] == _selectDay;
    }).toList();
  }

// 控制切换选中日
  _handleOnChangeDay(int selectedDay) {
    setState(() {
      _selectDay = selectedDay.toString();
    });
  }

// 控制日历组件切换月份的时候的回调
  _handleOnChangeMonth(String year, String month) {
    setState(() {
      _selectMonth = month;
      _selectYear = year;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseTableProvider>(
      builder: (context, table, _) {
        _classData = table.searchTable(_selectYear, _selectMonth);
        _setShowData();
        return BaseLayout(
          backgroundColor: Colors.white,
          title: '课程日历',
          navBarB: Stack(alignment: Alignment.center, children: [
            Calendar(
              timeTable: _classData,
              handleOnChange: _handleOnChangeDay,
              handleOnChangeMonth: (String year, String month) =>
                  _handleOnChangeMonth(year, month),
            ),
            if (_loading) CircularProgressIndicator(),
          ]),
          components: _showData.isEmpty
              ? _renderEmpty()
              : ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: _showData.length,
                  itemBuilder: (context, index) {
                    CourseTable courseTable = _showData[index];
                    return InkWell(
                        onTap: () {
                          navigatorKey.currentState.pushNamed(
                              '/TimeTableDetail',
                              arguments: {'courseInfo': courseTable});
                        },
                        child: TimeTableItem(item: courseTable));
                  }),
        );
      },
    );
  }
}
