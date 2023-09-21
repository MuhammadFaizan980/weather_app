import 'package:get/get.dart';

abstract class INavigator {
  Future<T?>? pushNamed<T>(String route, {dynamic arguments, int? id, bool preventDuplicates = true, Map<String, String>? parameters});

  void pop<T>({T? result});

  void popUntil(String route);

  void pushReplacementNamed(String route, {dynamic arguments});

  void popAndPushNamed(String route, {dynamic arguments});
}

class NavigatorImpl extends INavigator {
  @override
  void pop<T>({T? result}) {
    Get.back<T>(result: result);
  }

  @override
  void popUntil(String route) {
    Get.until((data) => data.settings.name == route);
  }

  @override
  Future<T?>? pushNamed<T>(String route, {dynamic arguments, int? id, bool preventDuplicates = true, Map<String, String>? parameters}) async {
    return await Get.toNamed<T>(route, arguments: arguments, id: id, preventDuplicates: preventDuplicates, parameters: parameters);
  }

  @override
  void pushReplacementNamed(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }

  @override
  void popAndPushNamed(String route, {dynamic arguments}) {
    Get.offAndToNamed(route, arguments: arguments);
  }
}
