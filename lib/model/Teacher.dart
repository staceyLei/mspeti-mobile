import 'package:educationapp/model/CommentM.dart';
import 'package:educationapp/model/CourseM.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Teacher.g.dart';

@JsonSerializable()
class Teacher {
  @JsonKey(name: 'teacherName')
  String teacherName;
  @JsonKey(name: 'teacherId')
  String teacherId;
  @JsonKey(name: 'teacherGender')
  String teacherGender;
  @JsonKey(name: 'teacherAge')
  String teacherAge;
  @JsonKey(name: 'teacherPhone')
  String teacherPhone;
  @JsonKey(name: 'teacherEmail')
  String teacherEmail;
  @JsonKey(name: 'teacherImg')
  String teacherImg;
  @JsonKey(name: 'teacherInfo')
  String teacherInfo;
  @JsonKey(name: 'teacherCourse')
  List<CourseM> teacherCourse;
  @JsonKey(name: 'teacherComment')
  List<CommentM> teacherComment;

  Teacher(
      this.teacherAge,
      this.teacherCourse,
      this.teacherEmail,
      this.teacherGender,
      this.teacherId,
      this.teacherImg,
      this.teacherName,
      this.teacherComment,
      this.teacherInfo,
      this.teacherPhone);

  factory Teacher.fromJson(Map<String, dynamic> srcJson) =>
      _$TeacherFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
