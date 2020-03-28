import 'package:json_annotation/json_annotation.dart';

import 'typeitem.dart';

part 'types.g.dart';

@JsonSerializable()
class Types {
  int slot;
  TypeItem type;

  Types(this.slot, this.type);

  Map<String, dynamic> toJson(instance) => _$TypesToJson(this);
  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
}
