import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<String> types;
  final List<String> moves;

  Pokemon(
      {@required this.id,
      @required this.name,
      @required this.weight,
      @required this.height,
      @required this.types,
      @required this.moves});

  @override
  List<Object> get props => [id, name];
}
