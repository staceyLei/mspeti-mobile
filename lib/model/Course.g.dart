// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    json['courseId'] as String,
    json['courseHours'] as String,
    json['courseImg'] as String,
    json['courseInfo'] as String,
    json['courseName'] as String,
    json['coursePeopleNum'] as String,
    json['coursePrice'] as String,
    json['courseTeacher'] as String,
    json['endDate'] as String,
    (json['courseTime'] as List)
        ?.map(
            (e) => e == null ? null : CTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['startDate'] as String,
  )..teacherImg = json['teacherImg'] as String;
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'courseName': instance.courseName,
      'teacherImg': instance.teacherImg,
      'courseHours': instance.courseHours,
      'courseTeacher': instance.courseTeacher,
      'courseImg': instance.courseImg,
      'courseInfo': instance.courseInfo,
      'coursePrice': instance.coursePrice,
      'coursePeopleNum': instance.coursePeopleNum,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'courseTime': instance.courseTime,
    };
