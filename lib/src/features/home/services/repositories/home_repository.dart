import 'package:dartz/dartz.dart';
import 'package:it_zone_task/app/errors/failures.dart';
import 'package:it_zone_task/app/models/city_details_model.dart';
import 'package:it_zone_task/app/models/weather_details_model.dart';
import 'package:it_zone_task/src/features/home/services/data/get_weather_from_lat_lng_params.dart';

abstract class HomeRepository {
  // This method will fetch city details with lat,lng
  // Input: [String] city name
  // Output: [CityDetailsModel] in case of success
  // Output: [Failure] in case of failure
  Future<Either<Failure, CityDetailsModel>> getCityDetailsFromCityName({required String cityName});

  // This method will fetch weather details from lat,lng
  // Input: [GetWeatherFromLatLngParams] params
  // Output: [WeatherDetailsModel] in case of success
  // Output: [Failure] in case of failure
  Future<Either<Failure, WeatherDetailsModel>> getWeatherDetailsFromLatLng({required GetWeatherFromLatLngParams params});
}
