import 'package:get/get.dart';
import 'package:it_zone_task/utils/routes/navigator.dart';

abstract class BaseController extends GetxController {
  INavigator iNavigator;

  BaseController(this.iNavigator);
}
