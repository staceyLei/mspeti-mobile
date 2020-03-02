import 'dart:io';

import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final String img;
  final double size;
  Skeleton({this.img, this.size});

  Image _getImageItem(String url) {
    if (url.contains('http')) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        width: size,
        height: size,
      );
    } else {
      File file = File(url);
      return Image.file(
        file,
        fit: BoxFit.cover,
        width: size,
        height: size,
      );
    }
  }

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
      if(img.isNotEmpty)
      ClipOval(
        child: _getImageItem(img),
      ),
    ]);
  }
}
