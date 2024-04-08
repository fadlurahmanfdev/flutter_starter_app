import 'package:flutter_starter_app/core/config/data/route_model.dart';
import 'package:flutter_starter_app/core/config/di/route_module.dart';
import 'package:flutter_starter_app/features/example/presentation/example_features_screen.dart';
import 'package:flutter_starter_app/features/example/presentation/notification/example_notification_screen.dart';

class ExampleRouteModule extends RouteModule {
  @override
  List<RouteModel> get routes => [
        RouteModel(
          screenType: ExampleFeaturesScreen,
          page: (context) => const ExampleFeaturesScreen(),
          isFirstRoute: true,
        ),
        RouteModel(
          screenType: ExampleNotificationScreen,
          page: (context) => const ExampleNotificationScreen(),
        ),
      ];
}
