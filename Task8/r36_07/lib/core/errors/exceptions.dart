class ServerException implements Exception {
  const ServerException(this.message);

  final String message;

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  const NetworkException(this.message);

  final String message;

  @override
  String toString() => message;
}
