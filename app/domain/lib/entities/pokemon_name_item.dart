import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PokemonNameItem extends Equatable {
  final String name;
  final String url;

  PokemonNameItem({@required this.name, @required this.url});

  @override
  List<Object> get props => [name, url];
}
