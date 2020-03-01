import 'package:educationapp/model/GrowUpM.dart';
import 'package:educationapp/pages/components/DatePicker.dart';
import 'package:educationapp/provider/GrowUpProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'component/const.dart';
import 'component/GrowUpItem.dart';

class GrowUp extends StatefulWidget {
  @override
  State<GrowUp> createState() {
    return _GrowUpState();
  }
}

class _GrowUpState extends State<GrowUp> {
  List<GrowUpM> _renderData = [];
  int _selectYear;
  int _selectMonth;
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    _selectYear = now.year;
    _selectMonth = now.month;
  }

  Widget _renderNav() {
    return Container(
      width: style.width,
      padding: EdgeInsets.fromLTRB(10, style.topPadding + 10, 15, 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: style.grey, width: 1.0)),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 25,
              height: 25,
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                "assets/icon/arrow-left-black.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('我的成长',
                textAlign: TextAlign.center,
                style:
                    style.baseFontStyle.copyWith(fontSize: style.bigFontSize)),
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }

  Widget _renderFloatBtn() {
    return InkWell(
        onTap: () {
          navigatorKey.currentState
              .pushNamed('/NewGrowUp', arguments: {'status': 0});
        },
        child: Container(
          width: 55,
          height: 55,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: style.themeColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: <BoxShadow>[
                BoxShadow(blurRadius: 10, color: Colors.black12)
              ]),
          child: Image.asset(
            "assets/icon/icon-create.png",
            fit: BoxFit.contain,
          ),
        ));
  }

  _handleChangeYear(int value) {
    print('year:$value');
  }

  _handleChangeMonth(int value) {
    print('month:$value');
  }

  _handleOnOk(int year, int month) {
    setState(() {
      _selectYear = year;
      _selectMonth = month;
    });
  }

  Widget _renderEmpty() {
    return Column(children: [
      Container(
          width: 150,
          margin: EdgeInsets.fromLTRB(0, 50, 0, 15),
          child:
              Image.asset('assets/icon/icon-none.png', fit: BoxFit.fitWidth)),
      Text('当月没有记录', style: style.mFontStyle)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            floatingActionButton: _renderFloatBtn(),
            backgroundColor: style.grey,
            resizeToAvoidBottomPadding: false,
            body: Consumer<GrowUpProvider>(
              builder: (context, growUp, _) {
                _renderData = growUp.searchGrowUp(
                    _selectYear.toString(), _selectMonth.toString());
                return Column(
                  children: <Widget>[
                    _renderNav(),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('我的成长记录',
                                style: style.baseFontStyle.copyWith(
                                    fontSize: style.titleSize,
                                    fontWeight: FontWeight.bold)),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (_) => DatePicker(
                                            changeMonth: _handleChangeMonth,
                                            selectM: _selectMonth,
                                            selectY: _selectYear,
                                            changeYear: _handleChangeYear,
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
                    ),
                    Expanded(
                        flex: 1,
                        child: _renderData.isEmpty
                            ? _renderEmpty()
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                itemCount: _renderData.length,
                                itemBuilder: (buildContext, index) {
                                  GrowUpM item = _renderData[index];
                                  return InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            '/NewGrowUp',
                                            arguments: {
                                              'status': 1,
                                              'item': item
                                            });
                                      },
                                      child: GrowUpItem(
                                        item: item,
                                      ));
                                }))
                  ],
                );
              },
            )));
  }
}
