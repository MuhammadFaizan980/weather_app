import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:it_zone_task/app/base/base_controller.dart';
import 'package:it_zone_task/app/models/city_details_model.dart';
import 'package:it_zone_task/app/models/weather_details_model.dart';
import 'package:it_zone_task/src/features/home/services/data/get_weather_from_lat_lng_params.dart';
import 'package:it_zone_task/utils/routes/navigator.dart';
import 'package:it_zone_task/utils/utils.dart';

import 'services/usecases/get_city_details_from_name_use_case.dart';
import 'services/usecases/get_weather_details_from_lat_lng_use_case.dart';

class HomeScreenController extends BaseController {
  final GetCityNameFromNameUseCase _getCityNameFromNameUseCase;
  final GetWeatherDetailsFromLatLngUseCase _getWeatherDetailsFromLatLngUseCase;
  Rxn<CityDetailsModel> cityDetailsModel = Rxn<CityDetailsModel>();
  Rxn<WeatherDetailsModel> weatherDetailsModel = Rxn<WeatherDetailsModel>();
  RxBool isLoading = false.obs;
  Timer? timer;

  HomeScreenController({
    required INavigator iNavigator,
    required GetCityNameFromNameUseCase getCityNameFromNameUseCase,
    required GetWeatherDetailsFromLatLngUseCase getWeatherDetailsFromLatLngUseCase,
  })  : _getCityNameFromNameUseCase = getCityNameFromNameUseCase,
        _getWeatherDetailsFromLatLngUseCase = getWeatherDetailsFromLatLngUseCase,
        super(iNavigator);

  void onItemSearched(String searchedTerm) {
    try {
      timer?.cancel();
      if (searchedTerm.isEmpty) {
        return;
      }
    } catch (e) {
      print(e);
    }
    timer = Timer(const Duration(seconds: 2), () {
      getCityDetailsFromName(cityName: searchedTerm);
    });
  }

  Future<void> getCityDetailsFromName({required String cityName}) async {
    isLoading.value = true;
    final result = await _getCityNameFromNameUseCase(cityName);
    result.fold(
      (l) {
        isLoading.value = false;
        showErrorDialog(
          title: l.title,
          subtitle: l.message,
          positiveBtnTitle: 'Retry',
          negativeBtnTitle: 'Cancel',
          onPositiveTapped: () {
            iNavigator.pop();
            getCityDetailsFromName(cityName: cityName);
          },
          onNegativeTapped: () => iNavigator.pop(),
        );
      },
      (r) {
        cityDetailsModel.value = r;
        getWeatherDetailsFromLatLng();
      },
    );
  }

  Future<void> getWeatherDetailsFromLatLng() async {
    final result = await _getWeatherDetailsFromLatLngUseCase(
      GetWeatherFromLatLngParams(
        lat: cityDetailsModel.value?.lat ?? 0.0,
        lng: cityDetailsModel.value?.lon ?? 0.0,
      ),
    );
    result.fold(
      (l) {
        isLoading.value = false;
        showErrorDialog(
          title: l.title,
          subtitle: l.message,
          positiveBtnTitle: 'Retry',
          negativeBtnTitle: 'Cancel',
          onPositiveTapped: () {
            iNavigator.pop();
            getWeatherDetailsFromLatLng();
          },
          onNegativeTapped: () => iNavigator.pop(),
        );
      },
      (r) {
        weatherDetailsModel.value = r;
        FocusScope.of(Get.context!).unfocus();
      },
    );
    isLoading.value = false;
  }
}
