// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentM _$CommentMFromJson(Map<String, dynamic> json) {
  return CommentM(
    json['commentId'] as String,
    json['pubDate'] as String,
    json['pubName'] as String,
    json['pubWord'] as String,
    json['receiveName'] as String,
    json['star'] as String,
    json['courseName'] as String,
    json['pubImg'] as String,
    json['receiveImg'] as String,
  );
}

Map<String, dynamic> _$CommentMToJson(CommentM instance) => <String, dynamic>{
      'commentId': instance.commentId,
      'pubName': instance.pubName,
      'pubDate': instance.pubDate,
      'receiveName': instance.receiveName,
      'star': instance.star,
      'pubWord': instance.pubWord,
      'courseName': instance.courseName,
      'pubImg': instance.pubImg,
      'receiveImg': instance.receiveImg,
    };
