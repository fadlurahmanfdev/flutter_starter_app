import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // TODO(dev): add to drawable resource
    const initializationSettingsAndroid =
        AndroidInitializationSettings('logo_bank_mas');
    final initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await _plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  void _onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {}

  void _onDidReceiveNotificationResponse(NotificationResponse details) {}

  final _androidGeneralChannelNotificationDetail =
      const AndroidNotificationDetails(
    'GENERAL',
    'Umum',
    channelDescription: 'Notifikasi Umum',
    importance: Importance.max,
    priority: Priority.high,
  );
  final DarwinNotificationDetails _darwinNotificationDetails =
      const DarwinNotificationDetails(threadIdentifier: 'GENERAL');

  Future<void> showGeneralNotification(int id, String title, String body) {
    return _plugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: _androidGeneralChannelNotificationDetail,
        iOS: _darwinNotificationDetails,
      ),
    );
  }
}
