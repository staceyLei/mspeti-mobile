// 放大展示视频/图片页面
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';

class ShowMedia extends StatefulWidget {
  @override
  State<ShowMedia> createState() {
    return _ShowMediaState();
  }
}

class _ShowMediaState extends State<ShowMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
    );
  }
}
