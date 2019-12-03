import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/Login',
                  arguments: {"from": "/", "currentIndex": 0});
            },
            child: Container(
              height: 50,
              color: Colors.blue,
              child: Text('跳转登录页'),
            ),
          ),
        ));
  }
}
