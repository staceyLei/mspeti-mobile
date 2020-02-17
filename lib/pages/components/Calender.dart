import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/Util/TimeUtil.dart';
import './CalendarInfo.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/const.dart';

class Calendar extends StatefulWidget {
  final List timeTable;
  final Function handleOnChange;
  Calendar({this.timeTable, this.handleOnChange});
  @override
  State<Calendar> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> {
  int _currentYear; //当前选中年
  int _currentMonth; //当前选中月
  int _currentDay; //当前选中天
  //实际真正的年月日
  int _nowYear;
  int _nowMonth;
  int _nowDay;
  List<Map> _classDays; //该月份有课程的日子，以及当天所有课程的状态

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() {
    DateTime now = DateTime.now();
    _currentDay = now.day;
    _currentMonth = now.month;
    _currentYear = now.year;
    _nowDay = now.day;
    _nowMonth = now.month;
    _nowYear = now.year;
    // 课程状态为请假/缺勤/审核
    List<int> statusArr = [
      TimeTableStatus.absent.index,
      TimeTableStatus.asForLeave.index,
      TimeTableStatus.check.index
    ];
    _classDays = widget.timeTable.map((item) {
      List<String> dateArr = item['date'].split('-'); //得到【年，月，日】数组
      String status = item['status'];
      return {
        'day': int.parse(dateArr[2]), //找到有课的日
        'isAbsent': statusArr.contains(int.parse(status)), //该日是否缺席
      };
      // return int.parse(dateArr[2]);
    }).toList();
  }

// 渲染星期几的头部
  List<Widget> _renderWeekHead() {
    return TimeUtil.weekList.map((day) {
      return Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          color: Colors.white,
          child: Text(day,
              style: style.mFontStyle.copyWith(color: style.grey200)));
    }).toList();
  }

  Color _getBackgroundColor(
      bool isCurrent, bool hasClass, bool isAbsent, bool isOut, bool isNow) {
    if (isCurrent) {
      return style.orangeColor;
    } else if (hasClass && !isNow) {
      if (isAbsent) {
        return style.grey;
      } else if (isOut) {
        return Colors.yellow.withOpacity(0.5);
      } else {
        return Colors.white;
      }
    } else {
      return Colors.white;
    }
  }

// 渲染日期内容
  List<TableRow> _renderContent() {
    List<TableRow> content = <TableRow>[
      TableRow(
        children: _renderWeekHead(),
      )
    ];
    List totalDay = TimeUtil.getMonthDays(_currentYear, _currentMonth);
    while (totalDay.isNotEmpty) {
      TableRow _currentRow = TableRow(
          children: totalDay.take(7).map((day) {
        // 是否是选中日
        bool isCurrentDay = day == _currentDay;
        // 是否是真是日期的今天
        bool isNowDay = day == _nowDay &&
            _currentMonth == _nowMonth &&
            _currentYear == _nowYear;
        // 当天有几节课
        Iterable classArr = _classDays.where((days) => days['day'] == day);
        // 当天是否有课
        bool hasClass = classArr.isNotEmpty; //到课 缺勤 请假 审核
        Iterable isAbsentArr = classArr.where((days) => days['isAbsent']);
        // 是否当天的课未上完
        bool hasAbsent =
            hasClass && isAbsentArr.isNotEmpty;

        return day == -1
            ? SizedBox(
                width: 40,
                height: 40,
              )
            : InkWell(
                onTap: () {
                  if (!isCurrentDay) {
                    // 点击的时候改变当前选中日
                    setState(() {
                      _currentDay = day;
                    });
                    widget.handleOnChange(day);
                  }
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: hasClass && day >= _nowDay && !hasAbsent
                                ? style.orangeColor
                                : Colors.transparent,
                            width: 1),
                        color: _getBackgroundColor(isCurrentDay, hasClass,
                            hasAbsent, day < _nowDay, day == _nowDay)
                        // isCurrentDay
                        //     ? style.orangeColor
                        //     : hasClass && day < _nowDay
                        //         ? style.grey
                        //         : Colors.white
                        ),
                    child: Text(isNowDay ? '今' : day.toString(),
                        style: style.mFontStyle.copyWith(
                            color: isCurrentDay
                                ? Colors.white
                                : isNowDay
                                    ? style.orangeColor
                                    : style.baseFontColor)),
                  ),
                ));
      }).toList());
      content.add(_currentRow);
      totalDay = totalDay.sublist(7);
    }
    return content;
  }

  _handleChangeMonth(bool isNext) {
    setState(() {
      // 12月时点下个月要改变年
      if (_currentMonth == 12 && isNext) {
        _currentMonth = 1;
        _currentYear = _currentYear + 1;
      } else if (_currentMonth == 1 && !isNext) {
        //1月时点上个月改变年
        _currentMonth = 12;
        _currentYear = _currentYear - 1;
      } else {
        _currentMonth = isNext ? _currentMonth + 1 : _currentMonth - 1;
      }
      _currentDay =
          _currentMonth == _nowMonth && _currentYear == _nowYear ? _nowDay : 1;
    });
  }

  Widget _renderChangeBtn(bool isNext) {
    return InkWell(
        onTap: () => _handleChangeMonth(isNext),
        child: Container(
            width: 20,
            height: 20,
            padding: EdgeInsets.all(5),
            child: Icon(
              isNext ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
              color: style.grey200,
              size: 12,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10),
        child: Column(children: [
          Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                      child: Container(
                        height: 20,
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.help_outline,
                          color: style.lightGrey,
                          size: 20,
                        ),
                      ),
                      onTap: () => showCupertinoDialog(
                          context: context,
                          builder: (_) {
                            return CalendarInfo();
                          })),
                  flex: 1),
              _renderChangeBtn(false),
              SizedBox(
                  height: 20,
                  child: Text('$_currentYear年 $_currentMonth月',
                      style: style.mFontStyle)),
              _renderChangeBtn(true),
              SizedBox(width: 5),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.only(bottom: 5),
            width: style.width,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: style.borderColor, width: 0.5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      offset: Offset(0, 3),
                      blurRadius: 3),
                ]),
            child: Table(
                defaultColumnWidth: FixedColumnWidth(40),
                border: TableBorder.all(width: 0, color: Colors.transparent),
                children: _renderContent()),
          ),
        ]));
  }
}
