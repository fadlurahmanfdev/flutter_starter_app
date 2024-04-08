import 'package:flutter/material.dart';
import 'package:flutter_starter_app/core/config/di/class_module.dart';
import 'package:flutter_starter_app/core/config/di/route_module.dart';
import 'package:get_it/get_it.dart';

class AppRunnerSetting {
  final GetIt c;
  final List<RouteModule> routeModules;
  final List<ClassModule> classModules;
  final Widget app;

  AppRunnerSetting({
    required this.c,
    required this.routeModules,
    required this.classModules,
    required this.app,
  });
}