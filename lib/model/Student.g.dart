// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    json['studentAge'] as String,
    (json['studentCollection'] as List)
        ?.map((e) =>
            e == null ? null : CourseM.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['studentCourse'] as List)
        ?.map((e) =>
            e == null ? null : MyCourseM.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['studentEmail'] as String,
    json['studentGender'] as String,
    (json['studentGrow'] as List)
        ?.map((e) =>
            e == null ? null : GrowUpM.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['studentHomework'] as List)
        ?.map((e) =>
            e == null ? null : HomeworkM.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['studentId'] as String,
    json['studentImg'] as String,
    json['studentName'] as String,
    (json['studentComment'] as List)
        ?.map((e) =>
            e == null ? null : CommentM.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['studentAddress'] as String,
    json['studentPhone'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'studentName': instance.studentName,
      'studentId': instance.studentId,
      'studentGender': instance.studentGender,
      'studentAge': instance.studentAge,
      'studentPhone': instance.studentPhone,
      'studentEmail': instance.studentEmail,
      'studentImg': instance.studentImg,
      'studentAddress': instance.studentAddress,
      'studentCourse': instance.studentCourse?.map((e) => e?.toJson())?.toList(),
      'studentCollection': instance.studentCollection?.map((e) => e?.toJson())?.toList(),
      'studentHomework': instance.studentHomework?.map((e) => e?.toJson())?.toList(),
      'studentGrow': instance.studentGrow?.map((e) => e?.toJson())?.toList(),
      'studentComment': instance.studentComment?.map((e) => e?.toJson())?.toList(),
    };
