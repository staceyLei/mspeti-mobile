import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/model/Student.dart';
import 'package:flutter/foundation.dart';
import 'const.dart';

class UserProvider with ChangeNotifier {
  Student _student = Student.fromJson(studentData);
  bool _isLogin = false;

  Student get student => _student;
  bool get isLogin => _isLogin;
  List<CourseM> get collection => _student.studentCollection ?? [];

  editEmail(String email) {
    Student newStudent = Student.fromJson(_student.toJson());
    newStudent.studentEmail = email;
    _student = newStudent;
    notifyListeners();
  }

  editPhone(String phone) {
    Student newStudent = Student.fromJson(_student.toJson());
    newStudent.studentPhone = phone;
    _student = newStudent;
    notifyListeners();
  }

  bool toLogin(int type, Map params) {
    _isLogin = true;
    return _isLogin;
  }

  bool isCollect(CourseM course) {
    var res = collection?.where((e) => e.courseId == course.courseId);
    return res.isNotEmpty;
  }

  handleCollect(CourseM newCollect) {
    bool hasCollect = isCollect(newCollect);
      List<CourseM> newCollection = [...collection];
    if (hasCollect) {
      // 已经收藏，取消收藏
      newCollection.removeWhere((e) => e.courseId == newCollect.courseId);
      _student.studentCollection = newCollection;
    }else{
      _student.studentCollection = [...newCollection,newCollect];
    }
      notifyListeners();
  }

  toLogOut() {
    _isLogin = false;
  }
}
