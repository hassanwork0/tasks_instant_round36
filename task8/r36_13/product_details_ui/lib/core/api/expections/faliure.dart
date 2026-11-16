sealed class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('مفيش اتصال بالإنترنت، اتأكد من الشبكة');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('السيرفر أخد وقت طويل، حاول تاني');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('انتهت الجلسة، سجّل دخول تاني');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure() : super('عطل مؤقت في السيرفر، حاول بعد شوية');
}

class CancelledFailure extends Failure {
  const CancelledFailure() : super('اتلغى الطلب');
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}