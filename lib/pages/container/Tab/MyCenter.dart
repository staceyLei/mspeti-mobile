import 'package:flutter/material.dart';

class MyCenter extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    return _MyCenterState();
  }
}

class _MyCenterState extends State<MyCenter>{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
    );
  }

}
