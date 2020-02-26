import 'package:educationapp/model/CTime.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CourseArrangeTable extends StatelessWidget {
  
  final List<CTime> tableTime;
  CourseArrangeTable(this.tableTime);

  Map _getWeekDay = {
    '1': '周一',
    '2': '周二',
    '3': '周三',
    '4': '周四',
    '5': '周五',
    '7': '周日',
    '6': '周六',
  };
  List<TableRow> _renderTable() {
    List courseTime = tableTime ?? [];
    List<TableRow> table = [
      TableRow(
          decoration: BoxDecoration(
            color: style.grey,
          ),
          children: [
            _renderTableHead('上课时间'),
            _renderTableHead('开始时间'),
            _renderTableHead('结束时间'),
          ])
    ];
    Iterable<TableRow> tableContent = courseTime.map((row) {
      return TableRow(
          decoration: BoxDecoration(color: Colors.white),
          children: [
            _renderTableCell(_getWeekDay['${row.weekDay}']),
            _renderTableCell(row.startTime),
            _renderTableCell(row.endTime),
          ]);
    });
    table.addAll(tableContent);
    return table;
  }

  Widget _renderTableHead(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(title,
          textAlign: TextAlign.center,
          style: style.mFontStyle.copyWith(color: style.lightGrey)),
    );
  }

  Widget _renderTableCell(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(title, textAlign: TextAlign.center, style: style.mFontStyle),
    );
  }

  @override
  Widget build(BuildContext context) => Table(
        border: TableBorder.all(color: style.borderColor, width: 1.0),
        children: _renderTable(),
      );
}
