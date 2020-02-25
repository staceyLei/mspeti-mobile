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
  @JsonKey(name:'beginTime')
  String beginTime;
  @JsonKey(name:'endTime')
  String endTime;
  @JsonKey(name:'courseImg')
  String courseImg;
  @JsonKey(name:'courseTime')
  List<CTime> courseTime;
  @JsonKey(name:'myCourseId')
  String myCourseId;

  MyCourseM(
      this.courseName,
      this.courseHours,
      this.nowCourseHours,
      this.courseTeacher,
      this.beginTime,
      this.endTime,
      this.courseTime,
      this.courseImg,
      this.myCourseId);

  factory MyCourseM.fromJson(Map<String, dynamic> srcJson) =>
      _$MyCourseMFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyCourseMToJson(this);

}
