abstract class Failure implements Exception {
  String? get message;
}

class DefaultFailure extends Failure {
  final String? message;

  DefaultFailure({
    this.message,
  });
}

class RepositoryFailure extends Failure {
  final String? message;

  RepositoryFailure({
    this.message,
  });
}

class HttpClientError extends Failure {
  final String? message;
  final int? statusCode;
  HttpClientError({
    this.message,
    this.statusCode,
  });
}
