import 'package:dartz/dartz.dart';
import 'package:it_zone_task/app/errors/failures.dart';
import 'package:it_zone_task/app/models/weather_details_model.dart';
import 'package:it_zone_task/app/usecases/usecase.dart';
import 'package:it_zone_task/src/features/home/services/data/get_weather_from_lat_lng_params.dart';
import 'package:it_zone_task/src/features/home/services/repositories/home_repository.dart';

class GetWeatherDetailsFromLatLngUseCase extends UseCase<WeatherDetailsModel, GetWeatherFromLatLngParams> {
  final HomeRepository _repository;

  GetWeatherDetailsFromLatLngUseCase({required HomeRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, WeatherDetailsModel>> call(GetWeatherFromLatLngParams params) async {
    return await _repository.getWeatherDetailsFromLatLng(params: params);
  }
}
