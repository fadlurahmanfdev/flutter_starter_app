import 'package:flutter/cupertino.dart';
import 'package:flutter_starter_app/core/config/data/app_runner_setting.dart';
import 'package:flutter_starter_app/core/config/di/register_module.dart';

Future<void> appRunner({required AppRunnerSetting setting}) async {
  WidgetsFlutterBinding.ensureInitialized();
  registerRouteModule(setting.routeModules);
  runApp(setting.app);
}
