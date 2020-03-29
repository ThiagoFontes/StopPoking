import 'package:json_annotation/json_annotation.dart';

part 'move.g.dart';

@JsonSerializable()
class MoveItem {
  String name;
  String url;

  MoveItem(this.name, this.url);

  factory MoveItem.fromJson(Map<String, dynamic> json) => _$MoveItemFromJson(json);

  Map<String, dynamic> toJson(instance) => _$MoveItemToJson(this);
}
