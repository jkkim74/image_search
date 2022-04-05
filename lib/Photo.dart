import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';

@JsonSerializable()
class Photo{
  int id;
  String tags;
  String previewUrl;

  Photo({
    required this.id,
    required this.tags,
    required this.previewUrl,
  });

  factory Photo.fromJon(Map<String,dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

}