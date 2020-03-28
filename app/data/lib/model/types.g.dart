// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Types _$TypesFromJson(Map<String, dynamic> json) {
  return Types(
    json['slot'] as int,
    json['type'] == null
        ? null
        : TypeItem.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
