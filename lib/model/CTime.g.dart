// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CTime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CTime _$CTimeFromJson(Map<String, dynamic> json) {
  return CTime(
    json['weekDay'] as String,
    json['endTime'] as String,
    json['startTime'] as String,
  );
}

Map<String, dynamic> _$CTimeToJson(CTime instance) => <String, dynamic>{
      'weekDay': instance.weekDay,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
