abstract class Failure {
  const Failure(this.message);
  final String message;

  @override
  String toString() => 'Failure: $message';
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
