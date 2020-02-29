import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final String img;
  final double size;
  Skeleton({this.img, this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // 类似骨架屏的头像代替
      ClipOval(
        child: Image.asset(
          'assets/icon/user-head.png',
          fit: BoxFit.cover,
          width: size,
          height: size,
        ),
      ),
      ClipOval(
        child: Image.network(
          img,
          fit: BoxFit.cover,
          width: size,
          height: size,
        ),
      ),
    ]);
  }
}
