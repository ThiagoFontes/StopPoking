// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moveitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moves _$MovesFromJson(Map<String, dynamic> json) {
  return Moves(
    json['move'] == null
        ? null
        : MoveItem.fromJson(json['move'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MovesToJson(Moves instance) => <String, dynamic>{
      'move': instance.move,
    };
