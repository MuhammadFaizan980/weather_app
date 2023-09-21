import 'package:it_zone_task/app/errors/failures.dart';
import 'package:it_zone_task/app/models/city_details_model.dart';
import 'package:it_zone_task/app/models/weather_details_model.dart';
import 'package:it_zone_task/app/network/api_path.dart';
import 'package:it_zone_task/app/network/dio_wrapper.dart';
import 'package:it_zone_task/src/features/home/services/data/get_weather_from_lat_lng_params.dart';
import 'package:it_zone_task/src/features/home/services/datasource/home_remote_data_source.dart';

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final IDioWrapper _iDioWrapper;

  HomeRemoteDataSourceImp({required IDioWrapper iDioWrapper}) : _iDioWrapper = iDioWrapper;

  @override
  Future<CityDetailsModel> getCityDetailsFromCityName({required String cityName}) async {
    final result = await _iDioWrapper.onGet(
      api: APIPaths.geocoding,
      queryParameters: {
        'q': cityName,
        'limit': 1,
      },
    );

    if (result.data != null) {
      return CityDetailsModel.fromJson(result.data[0]);
    }
    throw const ServerFailure('Something went wrong');
  }

  @override
  Future<WeatherDetailsModel> getWeatherDetailsFromLAtLng({required GetWeatherFromLatLngParams params}) async {
    final result = await _iDioWrapper.onGet(
      api: APIPaths.oneCall,
      queryParameters: {
        'lat': params.lat,
        'lon': params.lng,
        'exclude': 'minutely,hourly,daily',
      },
    );

    if (result.data != null) {
      return WeatherDetailsModel.fromJson(result.data);
    }
    throw const ServerFailure('Something went wrong');
  }
}
