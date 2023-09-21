import 'package:dartz/dartz.dart';
import 'package:it_zone_task/app/errors/failures.dart';
import 'package:it_zone_task/app/models/city_details_model.dart';
import 'package:it_zone_task/app/usecases/usecase.dart';
import 'package:it_zone_task/src/features/home/services/repositories/home_repository.dart';

class GetCityNameFromNameUseCase extends UseCase<CityDetailsModel, String> {
  final HomeRepository _repository;

  GetCityNameFromNameUseCase({required HomeRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, CityDetailsModel>> call(String params) async {
    return await _repository.getCityDetailsFromCityName(cityName: params);
  }
}
