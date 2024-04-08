import 'package:flutter_starter_app/core/config/others/app_shared.dart';
import 'package:get/get.dart';

class NavigatorUtility {
  NavigatorUtility._();

  static NavigatorUtility? _instance;

  factory NavigatorUtility() => _instance ??= NavigatorUtility._();

  factory NavigatorUtility.newInstance() => _instance ??= NavigatorUtility._();

  static NavigatorUtility get I => NavigatorUtility();

  static NavigatorUtility get instance => NavigatorUtility();

  String _getFullPathNamed(String screen, {Transition? transition}) {
    final route = AppShared.I.routes
        .firstWhereOrNull((element) =>
    element.fullPath.contains('/${screen}_${transition.hashCode}') ||
        element.fullPath.contains('/$screen'))
        ?.fullPath ??
        '/UnknownRouteScreen';
    return route;
  }

  Future<T?>? push<T>(Type screen, {Transition? transition}) {
    if (transition != null) {
      return Get.toNamed('/${screen}_${transition.hashCode}');
    } else {
      return Get.toNamed('/$screen');
    }
  }

  Future<T?>? pushNamed<T>(String screen, {dynamic arguments, Transition? transition}) {
    final route = _getFullPathNamed(screen, transition: transition);
    return Get.toNamed(route, arguments: arguments);
  }

  Future<T?>? pushReplaceAll<T>(Type screen, {Transition? transition}) {
    if (transition != null) {
      return Get.offAllNamed('/${screen}_${transition.hashCode}');
    } else {
      return Get.offAllNamed('/$screen');
    }
  }

  Future<T?>? pushReplaceAllNamed<T>(String screen, {Transition? transition}) {
    final route = _getFullPathNamed(screen, transition: transition);
    return Get.offAllNamed(route);
  }

  void back<T>({T? result}) {
    return Get.back(result: result);
  }
}
