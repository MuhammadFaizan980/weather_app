import 'package:dartz/dartz.dart';

abstract class Failure {
  final String message;
  final String? title;

  const Failure(this.message, {this.title = 'Error'});
}

class CommonFailure extends Failure {
  const CommonFailure(String message, {String? title}) : super(message, title: title);
}

Failure handleFailure(Either<Failure, dynamic> resultEither) {
  return resultEither.fold((failure) => failure, (r) => null)!;
}

class DioInternalError extends Failure {
  const DioInternalError({required String message, String? title}) : super(message, title: title);
}

class DioNotFoundError extends Failure {
  const DioNotFoundError({required String message, String? title}) : super(message, title: title);
}

class DioContentNotFound extends Failure {
  const DioContentNotFound({required String message, String? title}) : super(message, title: title);
}

class DioBadRequest extends Failure {
  const DioBadRequest({required String message, String? title}) : super(message, title: title);
}

class DioUnAuthorized extends Failure {
  const DioUnAuthorized({required String message, String? title}) : super(message, title: title);
}

class ResultsNotFound extends Failure {
  const ResultsNotFound({required String message, String? title}) : super(message, title: title);
}

class DioDefaultFailure extends Failure {
  const DioDefaultFailure({required String message, String? title}) : super(message, title: title);
}

class ServiceUnavailableFailure extends Failure {
  const ServiceUnavailableFailure({required String message, String? title}) : super(message, title: title);
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String message, String? title}) : super(message, title: title);
}

class ServerFailure extends Failure {
  const ServerFailure(String message, {String? title}) : super(message, title: title);
}
