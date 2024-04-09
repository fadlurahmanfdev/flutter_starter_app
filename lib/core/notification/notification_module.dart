import 'package:flutter_starter_app/core/config/di/class_module.dart';
import 'package:flutter_starter_app/core/notification/domain/repository/notification_repository.dart';
import 'package:flutter_starter_app/core/notification/domain/repository/notification_repository_impl.dart';
import 'package:flutter_starter_app/core/notification/domain/service/notification_service.dart';
import 'package:flutter_starter_app/core/platform/repository/platform_repository.dart';
import 'package:get_it/get_it.dart';

class NotificationModule extends ClassModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingletonAsync<NotificationService>(
      () async => NotificationService()
        ..init()
        ..initListener(),
    );

    await c.isReady<NotificationService>();
    c.registerFactory<NotificationRepository>(() => NotificationRepositoryImpl(
        notificationService: c.get<NotificationService>(),
        platformRepository: c.get<PlatformRepository>()));
  }
}
