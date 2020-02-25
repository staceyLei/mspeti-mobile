// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyCourseM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourseM _$MyCourseMFromJson(Map<String, dynamic> json) {
  return MyCourseM(
    json['courseName'] as String,
    json['courseHours'] as String,
    json['nowCourseHours'] as String,
    json['courseTeacher'] == null
        ? null
        : Teacher.fromJson(json['courseTeacher'] as Map<String, dynamic>),
    json['beginTime'] as String,
    json['endTime'] as String,
    (json['courseTime'] as List)
        ?.map(
            (e) => e == null ? null : CTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['courseImg'] as String,
    json['myCourseId'] as String,
  );
}

Map<String, dynamic> _$MyCourseMToJson(MyCourseM instance) => <String, dynamic>{
      'courseName': instance.courseName,
      'courseHours': instance.courseHours,
      'nowCourseHours': instance.nowCourseHours,
      'courseTeacher': instance.courseTeacher,
      'beginTime': instance.beginTime,
      'endTime': instance.endTime,
      'courseImg': instance.courseImg,
      'courseTime': instance.courseTime,
      'myCourseId': instance.myCourseId,
    };
