import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_zone_task/src/features/home/home_screen_controller.dart';
import 'package:it_zone_task/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends GetView<HomeScreenController> {
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Stack(
              children: [
                Visibility(
                  visible: controller.weatherDetailsModel.value == null,
                  child: Align(
                    child: Lottie.asset(
                      AppAssets.cloudsLarge,
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.weatherDetailsModel.value != null,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Lottie.asset(
                      AppAssets.cloudsHorizontal,
                    ),
                  ),
                ),
                _buildBody(),
                SearchBar(
                  hintText: 'Search City',
                  trailing: [
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: Visibility(
                        visible: controller.isLoading.value,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.5,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (val) {
                    controller.onItemSearched(val);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Visibility(
      visible: controller.weatherDetailsModel.value != null,
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ((controller.weatherDetailsModel.value?.current?.temp ?? 0.0) - 273.15).toInt().toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 100,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const Text(
                  'c',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Feels like ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  '${((controller.weatherDetailsModel.value?.current?.feelsLike ?? 0.0) - 273.15).toInt()}c',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Humidity ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  '${controller.weatherDetailsModel.value?.current?.humidity?.toInt()}%',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wind Speed ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  '${((controller.weatherDetailsModel.value?.current?.windSpeed ?? 0.0) * 3.6).toStringAsFixed(1)} km/h',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
