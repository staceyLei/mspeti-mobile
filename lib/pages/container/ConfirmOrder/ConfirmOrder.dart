import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:flutter/services.dart';

class ConfirmOrder extends StatelessWidget {
  List<Widget> renderComponents() {
    return <Widget>[
      Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: style.baseRadius
        ),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 24.0,
                  height: 24.0,
                  child: Image.asset("assets/icon/icon-head.png",fit: BoxFit.contain,),
                ),
                SizedBox(width: 10.0,),
                Text('广州悦学悦知辅导机构',style: TextStyle(color: style.baseFontColor,fontSize: style.mFontSize),)
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: style.baseRadius,
                  ),
                  child: Image.asset("assets/icon/banner2.png",fit: BoxFit.fill,),
                ),
                SizedBox(width: 15.0,),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text("寒假全期小/初/高数学辅导班",
                      style:TextStyle(color: style.baseFontColor,fontSize: style.sFontSize)),
                      SizedBox(height: 5.0,),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: style.baseRadius,
                          color: Color.fromRGBO(243, 243, 243, 1),
                        ),
                        child: Text(
                          '课时：64学时；人数：20人',
                          style:TextStyle(color: style.lightGrey,fontSize: style.sFontSize,fontWeight: FontWeight.bold)
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Container(
                         padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: style.baseRadius,
                          color: Color.fromRGBO(255,235,210,1),
                        ),
                        child: Text(
                          '剩余：5',
                          style:TextStyle(
                            color: Color.fromRGBO(248,126,55,1),
                            fontSize: style.sFontSize,
                            fontWeight: FontWeight.bold)
                        ),
                      )
                    ],
                  ),
                ),
                Text('¥165',style: TextStyle(color: style.baseFontColor,fontSize: style.sFontSize),),
              ],
            )
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: NavLayout(
        backgroundColor: style.bgColor,
        title: '确认报名',
        components: this.renderComponents(),
        bottom: Container(
          width: style.width,
          padding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
