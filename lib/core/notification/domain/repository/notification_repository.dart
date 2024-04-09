abstract class NotificationRepository {
  Future<bool> isPermissionGranted();

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  });
}
