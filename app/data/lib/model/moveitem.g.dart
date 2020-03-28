// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moveitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveItem _$MoveItemFromJson(Map<String, dynamic> json) {
  return MoveItem(
    json['move'] == null
        ? null
        : Move.fromJson(json['move'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoveItemToJson(MoveItem instance) => <String, dynamic>{
      'move': instance.move,
    };
