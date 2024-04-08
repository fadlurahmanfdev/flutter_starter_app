import 'package:flutter_starter_app/core/config/others/app_shared.dart';
import 'package:flutter_starter_app/core/config/data/route_model.dart';

abstract class RouteModule {
  List<RouteModel> get routes;

  void addPages() {
    for (var route in routes) {
      AppShared.I.addRoute(route);
    }
  }
}
