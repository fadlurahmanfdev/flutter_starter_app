import 'package:flutter_starter_app/core/config/di/class_module.dart';
import 'package:flutter_starter_app/core/config/di/route_module.dart';
import 'package:get_it/get_it.dart';

void registerRouteModule(List<RouteModule> routeModules) {
  for (final route in routeModules) {
    route.addPages();
  }
}

Future<void> registerClassModule(
  GetIt c, {
  required List<ClassModule> classModules,
}) async {
  await Future.forEach(
    classModules,
    (element) async => await element.registerDependency(c),
  );
}
