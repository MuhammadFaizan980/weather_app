import 'package:dartz/dartz.dart';
import 'package:it_zone_task/app/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class InstantUseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

class NoParams {}
