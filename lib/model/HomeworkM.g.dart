// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeworkM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeworkM _$HomeworkMFromJson(Map<String, dynamic> json) {
  return HomeworkM(
    json['homeworkId'] as String,
    json['courseImg'] as String,
    json['courseName'] as String,
    json['courseTeacher'] == null
        ? null
        : Teacher.fromJson(json['courseTeacher'] as Map<String, dynamic>),
    json['endDate'] as String,
    json['homeworkContent'] as String,
    json['homeworkGrade'] as String,
    json['homeworkTitle'] as String,
    json['pubContent'] as String,
    json['pubDate'] as String,
    json['pubImg'] as String,
    json['pubVideo'] as String,
    json['status'] as String,
    json['submitDate'] as String,
    json['teacherComment'] as String,
  );
}

Map<String, dynamic> _$HomeworkMToJson(HomeworkM instance) => <String, dynamic>{
      'homeworkId': instance.homeworkId,
      'homeworkTitle': instance.homeworkTitle,
      'status': instance.status,
      'homeworkContent': instance.homeworkContent,
      'courseTeacher': instance.courseTeacher,
      'pubDate': instance.pubDate,
      'endDate': instance.endDate,
      'homeworkGrade': instance.homeworkGrade,
      'pubImg': instance.pubImg,
      'pubVideo': instance.pubVideo,
      'pubContent': instance.pubContent,
      'teacherComment': instance.teacherComment,
      'submitDate': instance.submitDate,
      'courseName': instance.courseName,
      'courseImg': instance.courseImg,
    };
