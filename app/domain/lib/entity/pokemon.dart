import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<TypesEntity> types;
  final List<MovesEntity> moves;

  PokemonEntity({
    @required this.id,
    @required this.name,
    @required this.weight,
    @required this.height,
    @required this.types,
    @required this.moves,
  });

  @override
  List<Object> get props => [id, name];
}

class MovesEntity extends Equatable {
  final MoveItemEntity move;

  MovesEntity(this.move);

  @override
  List<Object> get props => [move];
}

class MoveItemEntity extends Equatable {
  final String name;

  MoveItemEntity(this.name);

  @override
  List<Object> get props => [name];
}

class TypesEntity extends Equatable {
  final int slot;
  final TypeItemEntity type;

  TypesEntity(this.slot, this.type);

  @override
  List<Object> get props => [slot, type];
}

class TypeItemEntity extends Equatable {
  final String name;
  final String url;

  TypeItemEntity(this.name, this.url);

  @override
  List<Object> get props => [name, url];
}
