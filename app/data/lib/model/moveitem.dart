import 'package:data/model/move.dart';
import 'package:domain/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moveitem.g.dart';

@JsonSerializable()
class Moves extends MovesEntity {
  final MoveItem move;

  Moves(this.move) : super(move);

  factory Moves.fromJson(Map<String, dynamic> json) =>
      _$MovesFromJson(json);

  Map<String, dynamic> toJson(instance) => _$MovesToJson(this);
}
