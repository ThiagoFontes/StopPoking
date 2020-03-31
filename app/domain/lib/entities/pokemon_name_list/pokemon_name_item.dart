import 'package:core/domain/entities/response.dart';
import 'package:meta/meta.dart';

class PokemonNameItemEntity extends Response {
  final String name;
  final String url;

  PokemonNameItemEntity({@required this.name, @required this.url})
      : super([name, url]);
}
