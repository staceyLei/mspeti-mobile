import 'package:json_annotation/json_annotation.dart';

part 'GrowUpM.g.dart';

@JsonSerializable()
class GrowUpM extends Object {
  @JsonKey(name: 'pubDate')
  String pubDate;
  @JsonKey(name: 'pubVideo')
  String pubVideo;
  @JsonKey(name: 'pubImg')
  String pubImg;
  @JsonKey(name: 'pubWord')
  String pubWord;
  @JsonKey(name: 'growUpId')
  String growUpId;

  GrowUpM(
      this.growUpId, this.pubDate, this.pubImg, this.pubVideo, this.pubWord);
  
  factory GrowUpM.fromJson(Map<String, dynamic> srcJson) =>
      _$GrowUpMFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GrowUpMToJson(this);
}
