import 'package:dartz/dartz.dart';
import 'package:it_zone_task/app/errors/failures.dart';
import 'package:it_zone_task/app/models/city_details_model.dart';
import 'package:it_zone_task/app/models/weather_details_model.dart';
import 'package:it_zone_task/src/features/home/services/data/get_weather_from_lat_lng_params.dart';
import 'package:it_zone_task/src/features/home/services/datasource/home_remote_data_source.dart';
import 'package:it_zone_task/src/features/home/services/repositories/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImp({required HomeRemoteDataSource homeRemoteDataSource}) : _homeRemoteDataSource = homeRemoteDataSource;

  @override
  Future<Either<Failure, CityDetailsModel>> getCityDetailsFromCityName({required String cityName}) async {
    try {
      final result = await _homeRemoteDataSource.getCityDetailsFromCityName(cityName: cityName);
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WeatherDetailsModel>> getWeatherDetailsFromLatLng({required GetWeatherFromLatLngParams params}) async {
    try {
      final result = await _homeRemoteDataSource.getWeatherDetailsFromLAtLng(params: params);
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
