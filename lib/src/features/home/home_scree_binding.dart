import 'package:get/get.dart';
import 'package:it_zone_task/app/network/dio_wrapper.dart';
import 'package:it_zone_task/src/features/home/home_screen_controller.dart';
import 'package:it_zone_task/src/features/home/services/datasource/home_remote_data_source.dart';
import 'package:it_zone_task/src/features/home/services/datasource/home_remote_data_source_imp.dart';
import 'package:it_zone_task/src/features/home/services/repositories/home_repository.dart';
import 'package:it_zone_task/src/features/home/services/repositories/home_repository_imp.dart';
import 'package:it_zone_task/utils/routes/navigator.dart';

import 'services/usecases/get_city_details_from_name_use_case.dart';
import 'services/usecases/get_weather_details_from_lat_lng_use_case.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImp(
        homeRemoteDataSource: Get.find<HomeRemoteDataSource>(),
      ),
    );
    Get.lazyPut<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImp(
        iDioWrapper: Get.find<IDioWrapper>(),
      ),
    );
    Get.lazyPut<GetCityNameFromNameUseCase>(
      () => GetCityNameFromNameUseCase(
        repository: Get.find<HomeRepository>(),
      ),
    );
    Get.lazyPut<GetWeatherDetailsFromLatLngUseCase>(
      () => GetWeatherDetailsFromLatLngUseCase(
        repository: Get.find<HomeRepository>(),
      ),
    );

    Get.put<HomeScreenController>(
      HomeScreenController(
        iNavigator: Get.find<INavigator>(),
        getCityNameFromNameUseCase: Get.find<GetCityNameFromNameUseCase>(),
        getWeatherDetailsFromLatLngUseCase: Get.find<GetWeatherDetailsFromLatLngUseCase>(),
      ),
    );
  }
}
