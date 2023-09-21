import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:it_zone_task/src/features/splash/splash_screen.dart';
import 'package:it_zone_task/utils/bindings/initial_bindings.dart';
import 'package:it_zone_task/utils/routes/on_generate_routes.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    OverlaySupport.global(
      child: GetMaterialApp(
        navigatorKey: Get.key,
        initialBinding: InitialBindings(),
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    ),
  );
}
