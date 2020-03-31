import 'package:domain/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move.g.dart';

@JsonSerializable()
class MoveItem extends MoveItemEntity {
  final String name;
  final String url;

  MoveItem(this.name, this.url) : super(name);

  factory MoveItem.fromJson(Map<String, dynamic> json) =>
      _$MoveItemFromJson(json);

  Map<String, dynamic> toJson(instance) => _$MoveItemToJson(this);
}
