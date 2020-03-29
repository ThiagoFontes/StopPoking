import 'package:domain/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type.g.dart';

@JsonSerializable()
class TypeItem extends TypeItemEntity {
  final String name;
  final String url;

  TypeItem(this.name, this.url) : super(name, url);

  Map<String, dynamic> toJson(instance) => _$TypeItemToJson(this);

  factory TypeItem.fromJson(Map<String, dynamic> json) =>
      _$TypeItemFromJson(json);
}
