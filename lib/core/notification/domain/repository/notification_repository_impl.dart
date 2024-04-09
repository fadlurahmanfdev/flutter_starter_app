import 'package:flutter_starter_app/core/notification/domain/repository/notification_repository.dart';
import 'package:flutter_starter_app/core/notification/domain/service/notification_service.dart';
import 'package:flutter_starter_app/core/platform/repository/platform_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationService notificationService;
  PlatformRepository platformRepository;

  NotificationRepositoryImpl({
    required this.notificationService,
    required this.platformRepository,
  });

  @override
  Future<bool> isPermissionGranted() async {
    final requestPermissionStatus =
        await platformRepository.requestPermission(Permission.notification);
    return requestPermissionStatus == PermissionStatus.granted;
  }

  @override
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) {
    return notificationService.showGeneralNotification(id: id, title: title, body: body, payload: payload);
  }
}
