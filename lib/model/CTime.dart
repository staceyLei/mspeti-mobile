import 'package:json_annotation/json_annotation.dart';
part 'CTime.g.dart';
@JsonSerializable()
class CTime extends Object {
  @JsonKey(name: 'weekDay')
  String weekDay;
  @JsonKey(name: 'startTime')
  String startTime;
  @JsonKey(name: 'endTime')
  String endTime;

  CTime(this.weekDay, this.endTime, this.startTime);

  factory CTime.fromJson(Map<String, dynamic> srcJson) =>
      _$CTimeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CTimeToJson(this);
}
