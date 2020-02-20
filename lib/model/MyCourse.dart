class MyCourse {
  final String courseName;
  final String courseHours;
  final String nowCourseHours;
  final String courseTeacher;
  final String beginTime;
  final String endTime;
  final String courseImg;
  final String teacherImg;
  final List courseTime;

  MyCourse(
      this.courseName,
      this.courseHours,
      this.nowCourseHours,
      this.courseTeacher,
      this.beginTime,
      this.endTime,
      this.courseImg,
      this.teacherImg,
      this.courseTime);

  MyCourse.fromJson(Map<String, dynamic> json)
      : courseName = json['courseName'],
        courseHours = json['courseHours'],
        courseImg = json['courseImg'],
        courseTeacher = json['courseTeacher'],
        beginTime = json['beginTime'],
        endTime = json['endTime'],
        courseTime = json['courseTime'],
        teacherImg = json['teacherImg'],
        nowCourseHours = json['nowCourseHours'];

  Map<String, dynamic> toJson() => {
        'courseName': courseName,
        'courseHours': courseHours,
        'courseImg': courseImg,
        'courseTeacher': courseTeacher,
        'beginTime': beginTime,
        'endTime': endTime,
        'courseTime': courseTime,
        'nowCourseHours': nowCourseHours,
        'teacherImg':teacherImg,
      };
}
