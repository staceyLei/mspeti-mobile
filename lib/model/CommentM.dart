import 'package:json_annotation/json_annotation.dart';
part 'CommentM.g.dart';

@JsonSerializable()
class CommentM extends Object {
  @JsonKey(name: 'commentId')
  String commentId;
  @JsonKey(name: 'pubName')
  String pubName;
  @JsonKey(name: 'pubDate')
  String pubDate;
  @JsonKey(name: 'receiveName')
  String receiveName;
  @JsonKey(name: 'star')
  String star;
  @JsonKey(name: 'pubWord')
  String pubWord;
  @JsonKey(name: 'courseName')
  String courseName;
  @JsonKey(name: 'pubImg')
  String pubImg;
  @JsonKey(name: 'receiveImg')
  String receiveImg;

  CommentM(
      this.commentId,
      this.pubDate,
      this.pubName,
      this.pubWord,
      this.receiveName,
      this.star,
      this.courseName,
      this.pubImg,
      this.receiveImg);

  factory CommentM.fromJson(Map<String, dynamic> srcJson) =>
      _$CommentMFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentMToJson(this);
}
