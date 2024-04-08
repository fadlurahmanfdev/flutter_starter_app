import 'package:flutter_starter_app/core/config/di/route_module.dart';

void registerRouteModule(List<RouteModule> routeModules){
  for(final route in routeModules){
    route.addPages();
  }
}