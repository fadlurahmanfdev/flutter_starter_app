abstract class NotificationRepository {
  Future<bool> isPermissionGranted();

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  });

  Future<void> showNetworkImageNotification({
    required int id,
    required String title,
    required String body,
    required String imageUrl,
    Map<String, dynamic>? payload,
  });
}
