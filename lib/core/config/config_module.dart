import 'package:flutter_starter_app/core/config/data/route_model.dart';
import 'package:flutter_starter_app/core/config/di/route_module.dart';
import 'package:flutter_starter_app/core/config/presentation/unknown_route_screen.dart';

class ConfigRouteModule extends RouteModule {
  @override
  List<RouteModel> get routes => [
        RouteModel(
          screenType: UnknownRouteScreen,
          page: (context) => const UnknownRouteScreen(),
        ),
      ];
}
