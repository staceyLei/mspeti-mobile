// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseTable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseTable _$CourseTableFromJson(Map<String, dynamic> json) {
  return CourseTable(
    json['courseDate'] as String,
    json['courseHours'] as String,
    json['courseStatus'] as String,
    json['courseTeacher'] == null
        ? null
        : Teacher.fromJson(json['courseTeacher'] as Map<String, dynamic>),
    json['endTime'] as String,
    json['startTime'] as String,
    json['tableId'] as String,
    json['courseName'] as String,
    json['courseImg'] as String,
  );
}

Map<String, dynamic> _$CourseTableToJson(CourseTable instance) =>
    <String, dynamic>{
      'tableId': instance.tableId,
      'courseTeacher': instance.courseTeacher?.toJson(),
      'courseName': instance.courseName,
      'courseImg': instance.courseImg,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'courseDate': instance.courseDate,
      'courseHours': instance.courseHours,
      'courseStatus': instance.courseStatus,
    };
