import 'package:flutter/cupertino.dart';
import 'package:flutter_starter_app/core/config/data/app_runner_setting.dart';
import 'package:flutter_starter_app/core/config/di/register_module.dart';
import 'package:flutter_starter_app/core/config/others/app_shared.dart';

Future<void> appRunner({required AppRunnerSetting setting}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppShared.I.setGetIt(setting.c);
  registerRouteModule(setting.routeModules);
  await registerClassModule(setting.c, classModules: setting.classModules);
  runApp(setting.app);
}
