import 'package:flutter/material.dart';
import 'package:educationapp/Util/TimeUtil.dart';
import 'package:educationapp/assets/style.dart' as style;

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
  List<int> _classDays; //该月份有课程的日子

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
    _classDays = widget.timeTable.map((item) {
      List<String> dateArr = item['date'].split('-'); //得到【年，月，日】数组
      return int.parse(dateArr[2]);
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
        bool isCurrentDay = day == _currentDay;
        bool isNowDay = day == _nowDay &&
            _currentMonth == _nowMonth &&
            _currentYear == _nowYear;
        // 有课 但课程已过时
        bool hasClass = _classDays.contains(day);
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
                            color: hasClass && day >= _nowDay
                                ? style.orangeColor
                                : Colors.transparent,
                            width: 1),
                        color: isCurrentDay
                            ? style.orangeColor
                            : hasClass && day < _nowDay
                                ? style.grey
                                : Colors.white),
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
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
            margin: EdgeInsets.only(bottom:5),
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
                ]
                ),
            child: Table(
                defaultColumnWidth: FixedColumnWidth(40),
                border: TableBorder.all(width: 0, color: Colors.transparent),
                children: _renderContent()),
          ),
        ]));
  }
}
