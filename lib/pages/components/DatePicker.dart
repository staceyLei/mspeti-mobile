import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class DatePicker extends StatefulWidget {
  final Function changeYear;
  final Function changeMonth;
  final int minYear;
  final int maxYear;
  final int minMonth;
  final int maxMonth;
  final int selectY;
  final int selectM;
  final Function handleOnOK;
  DatePicker(
      {this.changeMonth,
      this.changeYear,
      this.selectY,
      this.selectM,
      this.handleOnOK,
      this.minYear = 2000,
      this.maxYear = 2020,
      this.minMonth = 1,
      this.maxMonth = 12});
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  List<int> _yearList;
  List<int> _monthList;
  int _selectYear;
  int _selectMonth;
  int _changeY;
  int _changeM;
  @override
  void initState() {
    super.initState();
    _yearList = _getYearList();
    _monthList = _getMonthList();
    // 选中年对应的下标
    _selectYear = widget.selectY - widget.minYear;
    // 选中月对应的下标
    _selectMonth =
        widget.selectM == 0 ? 0 : widget.selectM - widget.minMonth + 1;
        // 选中的值
    _changeM = _monthList[_selectMonth];
    _changeY = _yearList[_selectYear];
  }

  List<int> _getYearList() {
    return List.generate(
        widget.maxYear - widget.minYear + 1, (index) => widget.minYear + index);
  }

  List<int> _getMonthList() {
    return [
      0,
      ...List.generate(widget.maxMonth - widget.minMonth + 1,
          (index) => widget.minMonth + index)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: style.height / 4 + 40,
        width: style.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text('取消',
                        style: style.mFontStyle.copyWith(color: Colors.blue)),
                  ),
                  InkWell(
                    onTap: () {
                      widget.handleOnOK(_changeY, _changeM);
                      Navigator.pop(context);
                    },
                    child: Text('确定',
                        style: style.mFontStyle.copyWith(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Row(children: [
              Container(
                  width: style.width / 2,
                  height: style.height / 4,
                  child: CupertinoPicker(
                      // 默认选中值
                      scrollController:
                          FixedExtentScrollController(initialItem: _selectYear),
                      backgroundColor: Colors.white,
                      itemExtent: 25,
                      onSelectedItemChanged: (index) {
                        // widget.changeYear(_yearList[index])
                        setState(() {
                          _changeY = _yearList[index];
                        });
                      },
                      children: _yearList
                          .map((year) => Center(
                              child: Text(year.toString(),
                                  style:
                                      style.mFontStyle.copyWith(fontSize: 20))))
                          .toList())),
              Container(
                  width: style.width / 2,
                  height: style.height / 4,
                  child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: _selectMonth),
                      backgroundColor: Colors.white,
                      itemExtent: 25,
                      onSelectedItemChanged: (index) {
                        // widget.changeMonth(_monthList[index]);
                        setState(() {
                          _changeM = _monthList[index];
                        });
                      },
                      children: _monthList.map((month) {
                        String text = month == 0 ? '全部' : month.toString();
                        return Center(
                            child: Text(text,
                                style:
                                    style.mFontStyle.copyWith(fontSize: 20)));
                      }).toList()))
            ])
          ],
        ));
  }
}
