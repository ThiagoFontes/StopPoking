// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveItem _$MoveItemFromJson(Map<String, dynamic> json) {
  return MoveItem(
    json['name'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$MoveItemToJson(MoveItem instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
