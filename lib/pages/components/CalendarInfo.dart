import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CalendarInfo extends StatelessWidget {
  final double _myPaddingH = style.width / 5;
  final double _myWidth = style.width * 3 / 5;
  final double _mypaddingV = style.height / 7 * 2;

  Widget _renderItem(Color color, String tips,
      {Color borderColor = Colors.transparent,
      Color textColor = style.baseFontColor}) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
        child: Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor, width: 1.0)),
              child: Text('10',
                  style: style.baseFontStyle.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none)),
            ),
            SizedBox(width: 15),
            Text(tips,
                style: style.baseFontStyle.copyWith(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none)),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        _myPaddingH,
        _mypaddingV,
        _myPaddingH,
        _mypaddingV,
      ),
      child: Container(
        width: _myWidth,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Stack(children: [
            Container(
              width: _myWidth,
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: style.baseGradient,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              child: Text('日历说明',
                  style: TextStyle(
                      fontSize: style.titleSize,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none)),
            ),
            Positioned(
                right: 5,
                top: 5,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.topRight,
                        child:
                            Icon(Icons.close, size: 14, color: Colors.white))))
          ]),
          _renderItem(Colors.white, '当天有课', borderColor: style.orangeColor),
          _renderItem(Colors.white, '当天无课'),
          _renderItem(style.orangeColor, '选中的日期', textColor: Colors.white),
          _renderItem(
            style.grey,
            '当天的课未上完(缺勤/请假)',
          ),
          _renderItem(
            Colors.yellow.withOpacity(0.5),
            '当天的课已上完',
          ),
        ]),
      ),
    );
  }
}
