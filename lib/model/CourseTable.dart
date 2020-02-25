import 'package:json_annotation/json_annotation.dart';
import 'Teacher.dart';

part 'CourseTable.g.dart';

@JsonSerializable()
class CourseTable extends Object {
  @JsonKey(name: 'tableId')
  String tableId;
  @JsonKey(name: 'courseTeacher')
  Teacher courseTeacher;
  @JsonKey(name: 'courseName')
  String courseName;
  @JsonKey(name: 'courseImg')
  String courseImg;
  @JsonKey(name: 'startTime')
  String startTime;
  @JsonKey(name: 'endTime')
  String endTime;
  @JsonKey(name: 'courseDate')
  String courseDate;
  @JsonKey(name: 'courseHours')
  String courseHours;
  @JsonKey(name: 'courseStatus')
  String courseStatus;

  CourseTable(this.courseDate, this.courseHours, this.courseStatus,
      this.courseTeacher, this.endTime, this.startTime, this.tableId,this.courseName,this.courseImg);

  factory CourseTable.fromJson(Map<String, dynamic> srcJson) =>
      _$CourseTableFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseTableToJson(this);
}
