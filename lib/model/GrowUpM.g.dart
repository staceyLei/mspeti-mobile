// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GrowUpM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrowUpM _$GrowUpMFromJson(Map<String, dynamic> json) {
  return GrowUpM(
    json['growUpId'] as String,
    json['pubDate'] as String,
    json['pubImg'] as String,
    json['pubVideo'] as String,
    json['pubWord'] as String,
  );
}

Map<String, dynamic> _$GrowUpMToJson(GrowUpM instance) => <String, dynamic>{
      'pubDate': instance.pubDate,
      'pubVideo': instance.pubVideo,
      'pubImg': instance.pubImg,
      'pubWord': instance.pubWord,
      'growUpId': instance.growUpId,
    };
