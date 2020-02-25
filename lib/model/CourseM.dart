import 'package:educationapp/model/CTime.dart';
import 'Teacher.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CourseM.g.dart';

@JsonSerializable()
class CourseM extends Object {
  @JsonKey(name: 'courseId')
  String courseId;

  @JsonKey(name: 'courseName')
  String courseName;
  @JsonKey(name: 'courseHours')
  String courseHours;
  @JsonKey(name: 'courseTeacher')
  Teacher courseTeacher;
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
  @JsonKey(name: 'discount')
  String discount;
  @JsonKey(name: 'courseTime')
  List<CTime> courseTime;

  CourseM(
      this.courseId,
      this.courseHours,
      this.courseImg,
      this.courseInfo,
      this.courseName,
      this.coursePeopleNum,
      this.coursePrice,
      this.courseTeacher,
      this.endDate,
      this.discount,
      this.courseTime,
      this.startDate);

  factory CourseM.fromJson(Map<String, dynamic> srcJson) =>
      _$CourseMFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseMToJson(this);
}

