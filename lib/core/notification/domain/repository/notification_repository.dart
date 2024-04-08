abstract class NotificationRepository {
  Future<bool> isPermissionGranted();

  Future<void> showNotification(int id, String title, String body);
}
