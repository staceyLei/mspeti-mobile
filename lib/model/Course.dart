import 'package:educationapp/model/CTime.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Course.g.dart';

@JsonSerializable()
class Course extends Object {
  @JsonKey(name: 'courseId')
  String courseId;

  @JsonKey(name: 'courseName')
  String courseName;
  @JsonKey(name: 'teacherImg')
  String teacherImg;

  @JsonKey(name: 'courseHours')
  String courseHours;
  @JsonKey(name: 'courseTeacher')
  String courseTeacher;
  @JsonKey(name: 'courseImg')
  String courseImg;
  @JsonKey(name: 'courseInfo')
  String courseInfo;
  @JsonKey(name: 'coursePrice')
  String coursePrice;
  @JsonKey(name: 'coursePeopleNum')
  String coursePeopleNum;
  @JsonKey(name: 'startDate')
  String startDate;
  @JsonKey(name: 'endDate')
  String endDate;
  @JsonKey(name: 'courseTime')
  List<CTime> courseTime;

  Course(
      this.courseId,
      this.courseHours,
      this.courseImg,
      this.courseInfo,
      this.courseName,
      this.coursePeopleNum,
      this.coursePrice,
      this.courseTeacher,
      this.endDate,
      this.courseTime,
      this.startDate);

  factory Course.fromJson(Map<String, dynamic> srcJson) =>
      _$CourseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

