// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseM _$CourseMFromJson(Map<String, dynamic> json) {
  return CourseM(
    json['courseId'] as String,
    json['courseHours'] as String,
    json['courseImg'] as String,
    json['courseInfo'] as String,
    json['courseName'] as String,
    json['coursePeopleNum'] as String,
    json['coursePrice'] as String,
    json['courseTeacher'] == null
        ? null
        : Teacher.fromJson(json['courseTeacher'] as Map<String, dynamic>),
    json['endDate'] as String,
    json['discount'] as String,
    (json['courseTime'] as List)
        ?.map(
            (e) => e == null ? null : CTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['startDate'] as String,
  );
}

Map<String, dynamic> _$CourseMToJson(CourseM instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'courseName': instance.courseName,
      'courseHours': instance.courseHours,
      'courseTeacher': instance.courseTeacher,
      'courseImg': instance.courseImg,
      'courseInfo': instance.courseInfo,
      'coursePrice': instance.coursePrice,
      'coursePeopleNum': instance.coursePeopleNum,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'discount': instance.discount,
      'courseTime': instance.courseTime,
    };
