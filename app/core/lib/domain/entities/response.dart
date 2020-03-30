import 'package:equatable/equatable.dart';

class Response extends Equatable {
  final List<Object> equatables;

  Response(this.equatables);

  @override
  List<Object> get props => [equatables];
}
