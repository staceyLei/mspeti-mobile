import 'package:educationapp/model/CommentM.dart';
import 'package:educationapp/model/CourseM.dart';
import 'package:educationapp/model/GrowUpM.dart';
import 'package:educationapp/model/HomeworkM.dart';
import 'package:educationapp/model/MyCourseM.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Student.g.dart';

@JsonSerializable()
class Student {
  @JsonKey(name: 'studentName')
  String studentName;
  @JsonKey(name: 'studentId')
  String studentId;
  @JsonKey(name: 'studentGender')
  String studentGender;
  @JsonKey(name: 'studentAge')
  String studentAge;
  @JsonKey(name: 'studentPhone')
  String studentPhone;
  @JsonKey(name: 'studentEmail')
  String studentEmail;
  @JsonKey(name: 'studentImg')
  String studentImg;
  @JsonKey(name: 'studentCourse')
  List<MyCourseM> studentCourse;
  @JsonKey(name: 'studentCollection')
  List<CourseM> studentCollection;
  @JsonKey(name: 'studentHomework')
  List<HomeworkM> studentHomework;
  @JsonKey(name: 'studentGrow')
  List<GrowUpM> studentGrow;
  @JsonKey(name: 'studentComment')
  List<CommentM> studentComment;

  Student(
      this.studentAge,
      this.studentCollection,
      this.studentCourse,
      this.studentEmail,
      this.studentGender,
      this.studentGrow,
      this.studentHomework,
      this.studentId,
      this.studentImg,
      this.studentName,
      this.studentComment,
      this.studentPhone);

  factory Student.fromJson(Map<String, dynamic> srcJson) =>
      _$StudentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
