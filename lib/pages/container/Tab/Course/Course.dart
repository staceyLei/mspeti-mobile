import 'package:flutter/material.dart';

class Course extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    return _CourseState();
  }
}

class _CourseState extends State<Course> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('课程'),
      ),
    );
  }

}
