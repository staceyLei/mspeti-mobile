import 'package:educationapp/model/CTime.dart';
import 'package:json_annotation/json_annotation.dart';
import 'Teacher.dart';
part 'MyCourseM.g.dart';

@JsonSerializable()
class MyCourseM {
  @JsonKey(name:'courseName')
  String courseName;

  @JsonKey(name:'courseHours')
  String courseHours;
  @JsonKey(name:'nowCourseHours')
  String nowCourseHours;
  @JsonKey(name:'courseTeacher')
  Teacher courseTeacher;
  @JsonKey(name:'startDate')
  String startDate;
  @JsonKey(name:'endDate')
  String endDate;
  @JsonKey(name:'courseImg')
  String courseImg;
  @JsonKey(name:'courseTime')
  List<CTime> courseTime;
  @JsonKey(name:'courseId')
  String courseId;

  MyCourseM(
      this.courseName,
      this.courseHours,
      this.nowCourseHours,
      this.courseTeacher,
      this.startDate,
      this.endDate,
      this.courseTime,
      this.courseImg,
      this.courseId);

  factory MyCourseM.fromJson(Map<String, dynamic> srcJson) =>
      _$MyCourseMFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyCourseMToJson(this);

}
