import 'package:json_annotation/json_annotation.dart';

part 'typeitem.g.dart';

@JsonSerializable()
class TypeItem {
  TypeItem(this.name, this.url);

  String name;
  String url;

  Map<String, dynamic> toJson(instance) => _$TypeItemToJson(this);

  factory TypeItem.fromJson(Map<String, dynamic> json) =>
      _$TypeItemFromJson(json);
}
