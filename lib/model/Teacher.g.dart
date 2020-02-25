// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    json['teacherAge'] as String,
    json['teacherCourse'] as List,
    json['teacherEmail'] as String,
    json['teacherGender'] as String,
    json['teacherId'] as String,
    json['teacherImg'] as String,
    json['teacherName'] as String,
    (json['teacherComment'] as List)
        ?.map((e) =>
            e == null ? null : CommentM.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['teacherInfo'] as String,
    json['teacherPhone'] as String,
  );
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'teacherName': instance.teacherName,
      'teacherId': instance.teacherId,
      'teacherGender': instance.teacherGender,
      'teacherAge': instance.teacherAge,
      'teacherPhone': instance.teacherPhone,
      'teacherEmail': instance.teacherEmail,
      'teacherImg': instance.teacherImg,
      'teacherInfo': instance.teacherInfo,
      'teacherCourse': instance.teacherCourse,
      'teacherComment': instance.teacherComment,
    };
