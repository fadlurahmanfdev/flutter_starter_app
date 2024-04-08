import 'package:flutter_starter_app/core/config/di/class_module.dart';
import 'package:flutter_starter_app/core/platform/repository/platform_repository.dart';
import 'package:flutter_starter_app/core/platform/repository/platform_repository_impl.dart';
import 'package:get_it/get_it.dart';

class PlatformModule extends ClassModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerFactory<PlatformRepository>(() => PlatformRepositoryImpl());
  }
}
