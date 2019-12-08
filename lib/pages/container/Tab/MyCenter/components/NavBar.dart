import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class NavBar extends StatelessWidget {
  double barOpacity;
  var barHeight;
  NavBar({this.barHeight, this.barOpacity, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: this.barOpacity > 0 ? 0 : this.barHeight, //层级问题，挡住底层设置按钮
      child: Opacity(
        opacity: this.barOpacity,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(45, 118, 202, 1),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12, //阴影颜色
                blurRadius: 20.0, //阴影大小
              ),
            ],
          ),
          padding: EdgeInsets.fromLTRB(15, style.topPadding, 15, 10),
          width: style.width,
          height: this.barHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  'assets/image/headImg.png',
                  fit: BoxFit.cover,
                  width: 35,
                  height: 35,
                ),
              ),
              Text('个人中心',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/SetUp');
                },
                child: Container(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    'assets/icon/icon-setup.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
