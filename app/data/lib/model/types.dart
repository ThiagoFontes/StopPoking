import 'package:domain/entities.dart';
import 'package:json_annotation/json_annotation.dart';
import 'type.dart';

part 'types.g.dart';

@JsonSerializable()
class Types extends TypesEntity {
  final int slot;
  final TypeItem type;

  Types(this.slot, this.type) : super(slot, type);

  Map<String, dynamic> toJson(instance) => _$TypesToJson(this);
  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
}
