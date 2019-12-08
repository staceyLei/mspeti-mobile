import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class NavBar extends StatelessWidget {
  double barOpacity;
  var barHeight;
  NavBar({this.barHeight, this.barOpacity, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Opacity(
        opacity: this.barOpacity,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(37, 177, 135, 1),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12, //阴影颜色
                blurRadius: 20.0, //阴影大小
              ),
            ],
          ),
          padding: EdgeInsets.only(top: style.topPadding),
          width: style.width,
          height: this.barHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 15.0,
              ),
              ClipOval(
                child: Image.asset(
                  'assets/image/headImg.png',
                  fit: BoxFit.cover,
                  width: 35,
                  height: 35,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    print('search');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 242, 243, 1),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 14,
                          height: 14,
                          margin: EdgeInsets.only(right: 5.0),
                          child: Image.asset('assets/icon/search.png',
                              fit: BoxFit.contain),
                        ),
                        Text('我的课表',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
