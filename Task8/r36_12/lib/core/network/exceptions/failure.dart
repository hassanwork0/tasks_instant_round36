sealed class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection, check your network.');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('The server took too long, please try again.');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('The session has ended, login again');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure()
    : super("There's a temporary server outage, please try again later.");
}

class CancelledFailure extends Failure {
  const CancelledFailure() : super('The order has been cancelled.');
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
