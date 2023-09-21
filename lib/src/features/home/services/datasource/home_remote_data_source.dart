import 'package:it_zone_task/app/models/city_details_model.dart';
import 'package:it_zone_task/app/models/weather_details_model.dart';
import 'package:it_zone_task/src/features/home/services/data/get_weather_from_lat_lng_params.dart';

abstract class HomeRemoteDataSource {
  // This method will fetch city details with lat,lng
  // Input: [String] city name
  // Output: [CityDetailsModel] in case of success
  // Might throw exception
  Future<CityDetailsModel> getCityDetailsFromCityName({required String cityName});

  // This method will fetch weather details from lat,lng
  // Input: [GetWeatherFromLatLngParams] params
  // Output: [WeatherDetailsModel] in case of success
  // Might throw exception
  Future<WeatherDetailsModel> getWeatherDetailsFromLAtLng({required GetWeatherFromLatLngParams params});
}
