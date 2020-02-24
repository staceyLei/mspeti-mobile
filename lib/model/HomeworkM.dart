import 'package:json_annotation/json_annotation.dart';

part 'HomeworkM.g.dart';

@JsonSerializable()
class HomeworkM extends Object {
  @JsonKey(name: 'homeworkId')
  String homeworkId;
  @JsonKey(name: 'homeworkTitle')
  String homeworkTitle;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'homeworkContent')
  String homeworkContent;
  @JsonKey(name: 'courseTeacher')
  String courseTeacher;
  @JsonKey(name: 'pubDate')
  String pubDate;
  @JsonKey(name: 'endDate')
  String endDate;
  @JsonKey(name: 'homeworkGrade')
  String homeworkGrade;
  @JsonKey(name: 'pubImg')
  String pubImg;
  @JsonKey(name: 'pubVideo')
  String pubVideo;
  @JsonKey(name: 'pubContent')
  String pubContent;
  @JsonKey(name: 'teacherComment')
  String teacherComment;
  @JsonKey(name: 'submitDate')
  String submitDate;
  @JsonKey(name: 'courseName')
  String courseName;
  @JsonKey(name: 'courseImg')
  String courseImg;

  HomeworkM(
      this.homeworkId,
      this.courseImg,
      this.courseName,
      this.courseTeacher,
      this.endDate,
      this.homeworkContent,
      this.homeworkGrade,
      this.homeworkTitle,
      this.pubContent,
      this.pubDate,
      this.pubImg,
      this.pubVideo,
      this.status,
      this.submitDate,
      this.teacherComment);

  factory HomeworkM.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeworkMFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeworkMToJson(this);
}
