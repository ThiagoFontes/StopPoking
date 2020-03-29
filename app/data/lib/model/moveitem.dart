import 'package:data/model/move.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moveitem.g.dart';

@JsonSerializable()
class Moves {
  MoveItem move;
  @JsonKey(ignore: true)
  String versionGroupDetails;

  Moves(this.move);

  factory Moves.fromJson(Map<String, dynamic> json) =>
      _$MovesFromJson(json);

  Map<String, dynamic> toJson(instance) => _$MovesToJson(this);
}
