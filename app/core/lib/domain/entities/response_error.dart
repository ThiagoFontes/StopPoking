import 'package:core/domain/entities/response.dart';

class ResponseError extends Response {
  final int status;
  final String errorMessage;

  ResponseError(this.status, this.errorMessage) : super([status, errorMessage]);
}