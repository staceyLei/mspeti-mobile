import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/model/MyCourseM.dart';
import 'package:educationapp/model/Student.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'const.dart';

class UserProvider with ChangeNotifier {
  // Student _student = Student.fromJson(studentData);
  Student _student;
  bool _isLogin = false;
  String _pwd;

  Student get student => _student;
  bool get isLogin => _isLogin;
  List<CourseM> get collection => _student.studentCollection ?? [];
  List<MyCourseM> get myCourse => _student.studentCourse ?? [];

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
    // 初始化数据
    _isLogin = true;
    _student = Student.fromJson(studentData);
    notifyListeners();
    return _isLogin;
  }

  bool isCollect(CourseM course) {
    var res = collection?.where((e) => e.courseId == course.courseId);
    return res != null && res.isNotEmpty;
  }

// 课程详情页的收藏
  handleCollect(CourseM newCollect) {
    bool hasCollect = isCollect(newCollect);
    List<CourseM> newCollection = [...collection];
    if (hasCollect) {
      // 已经收藏，取消收藏
      newCollection.removeWhere((e) => e.courseId == newCollect.courseId);
      _student.studentCollection = newCollection;
    } else {
      _student.studentCollection = [...newCollection, newCollect];
    }
    notifyListeners();
  }

  // 购物车的移入收藏夹
  moveInCollect(List<CourseM> collectionList) {
    List<CourseM> list = collectionList.where((e) => !isCollect(e)).toList();
    _student.studentCollection = [...collection, ...list];
    notifyListeners();
  }

  removeFromCollect(List<String> courseIds) {
    List<CourseM> list = [...collection];
    list.removeWhere((e) {
      return courseIds.contains(e.courseId);
    });
    _student.studentCollection = [...list];
    notifyListeners();
    Fluttertoast.showToast(msg: '已取消收藏', gravity: ToastGravity.CENTER);
  }

// 已经报名的课程不能重复报名或加入购物车
  hasCourse(CourseM course) {
    var res = myCourse.where((e) => e.courseId == course.courseId);
    return res.isNotEmpty;
  }

  // 已经报名的课程不能重复报名或加入购物车
  hasCourseById(String id) {
    var res = myCourse.where((e) => e.courseId == id);
    return res.isNotEmpty;
  }

// 报名课程后添加入我的课程
  addToMyCourse(List<CourseM> courseList) {
    List<MyCourseM> newList = courseList.map((e) {
      MyCourseM newC = MyCourseM.fromJson(e.toJson());
      // 初始化课程现学时为0
      newC.nowCourseHours = '0';
      return newC;
    }).toList();
    _student.studentCourse = [...myCourse, ...newList];
    notifyListeners();
  }

  searchForCollection(String keyWords) {
    List<CourseM> searchRes = collection
        .where((course) => course.courseName.contains(keyWords))
        .toList();
    return searchRes;
  }

  toLogOut() {
    _isLogin = false;
    notifyListeners();
  }
}
