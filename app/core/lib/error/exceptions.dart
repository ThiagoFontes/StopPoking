class ServerException implements Exception {}

class NetworkException implements Exception {
  final String message;

  NetworkException({this.message});
}
