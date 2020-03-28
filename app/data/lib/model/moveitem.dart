import 'package:data/model/move.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moveitem.g.dart';

@JsonSerializable()
class MoveItem {
  Move move;
  @JsonKey(ignore: true)
  String versionGroupDetails;

  MoveItem(this.move);

  factory MoveItem.fromJson(Map<String, dynamic> json) =>
      _$MoveItemFromJson(json);

  Map<String, dynamic> toJson(instance) => _$MoveItemToJson(this);
}
