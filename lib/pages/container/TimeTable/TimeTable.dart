import 'package:flutter/material.dart';
import 'package:educationapp/pages/components/Calender.dart';
import 'package:educationapp/pages/components/BaseLayout.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'const.dart';
import 'component/TimeTableItem.dart';

class TimeTable extends StatefulWidget {
  @override
  State<TimeTable> createState() {
    return _TimeTableState();
  }
}

class _TimeTableState extends State<TimeTable> {
  List _classData;
  List _showData;
  bool _loading = false; //切换月份时候加载

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    _handleChangeMonth(now.year, now.month);
    _handleOnChangeDay(DateTime.now().day);
  }

  Widget _renderEmpty() {
    return Container(
      color:Colors.white,
      width: style.width,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            child: Image.asset(
              'assets/icon/homework-none.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height:20),
          Text('今天没有课噢，预习一下别的课程吧~',
              style: style.baseFontStyle
                  .copyWith(color: style.lightGrey)),
        ])
    );
  }

  _handleOnChangeDay(int selectedDay) {
    setState(() {
      _showData = _classData.where((item) {
        List<String> _dateArr = item['date'].split('-');
        return _dateArr[2] == selectedDay.toString();
      }).toList();
    });
  }

  _handleChangeMonth(int year, int month) {
    // 接口搜索某年某月获得课表数据
    setState(() {
      _classData = classList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      backgroundColor: Colors.white,
      title: '课程日历',
      navBarB: Stack(alignment: Alignment.center, children: [
        Calendar(timeTable: _classData, handleOnChange: _handleOnChangeDay),
        _loading ? CircularProgressIndicator() : SizedBox(),
      ]),
      components: _showData.isEmpty
          ? _renderEmpty()
          : ListView.builder(
            padding: EdgeInsets.all(0),
              itemCount: _showData.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {}, child: TimeTableItem(item: _showData[index]))),
    );
  }
}
