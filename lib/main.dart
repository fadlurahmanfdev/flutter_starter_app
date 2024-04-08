import 'package:flutter_starter_app/core/config/config_module.dart';
import 'package:flutter_starter_app/core/config/di/class_module.dart';
import 'package:flutter_starter_app/core/config/di/route_module.dart';
import 'package:flutter_starter_app/core/config/others/app_runner.dart';
import 'package:flutter_starter_app/core/config/data/app_runner_setting.dart';
import 'package:flutter_starter_app/core/config/presentation/app.dart';
import 'package:flutter_starter_app/core/notification/notification_module.dart';
import 'package:flutter_starter_app/core/platform/platform_module.dart';
import 'package:flutter_starter_app/features/example/example_module.dart';
import 'package:get_it/get_it.dart';

final _routeModules = <RouteModule>[
  ConfigRouteModule(),
  ExampleRouteModule(),
];

final _devModules = <ClassModule>[
  PlatformModule(),
  NotificationModule(),
];

final _devSetting = AppRunnerSetting(
  c: GetIt.I,
  routeModules: _routeModules,
  classModules: _devModules,
  app: const MyApp(),
);

Future<void> main() async {
  appRunner(setting: _devSetting);
}
