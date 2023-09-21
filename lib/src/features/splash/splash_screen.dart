import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_zone_task/src/features/home/home_screen.dart';
import 'package:it_zone_task/utils/app_assets.dart';
import 'package:it_zone_task/utils/routes/navigator.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash-screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final INavigator _iNavigator = Get.find<INavigator>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) => _iNavigator.pushNamed(
        HomeScreen.routeName,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(AppAssets.cloudsInFrontOfSunAnimation),
      ),
    );
  }
}
