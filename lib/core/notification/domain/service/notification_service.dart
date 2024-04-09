import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_starter_app/core/notification/data/local_notification_message_model.dart';
import 'package:flutter_starter_app/core/notification/others/top_level.dart';

class NotificationService {
  final localNotificationPlugin = FlutterLocalNotificationsPlugin();

  late StreamController<LocalNotificationMessageModel>
      _onTapForegroundNotificationClicked;

  Stream<LocalNotificationMessageModel> get onTapForegroundNotificationClicked {
    return _onTapForegroundNotificationClicked.stream;
  }

  bool isTapForegroundNotificationListening = false;

  void initListener() {
    if (!isTapForegroundNotificationListening) {
      _onTapForegroundNotificationClicked = StreamController();
      isTapForegroundNotificationListening = true;
    }
  }

  void removeListener() {
    if (isTapForegroundNotificationListening) {
      _onTapForegroundNotificationClicked.close();
      isTapForegroundNotificationListening = false;
    }
  }

  Future<void> init() async {
    // TODO(dev): add to drawable resource
    const initializationSettingsAndroid =
        AndroidInitializationSettings('logo_bank_mas');
    final initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await localNotificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    log("onDidReceiveLocalNotification: $id, $title, $body, $payload");
  }

  void onDidReceiveNotificationResponse(NotificationResponse details) {
    log("onDidReceiveNotificationResponse: ${details.payload}");
    try {
      final payload = details.payload;
      if(payload == null) return;
      final decodedPayload = json.decode(payload) as Map<String, dynamic>;
      final message = LocalNotificationMessageModel.fromJson(decodedPayload);
      _onTapForegroundNotificationClicked.sink.add(message);
    } on Exception catch (e) {
      log("onDidReceiveNotificationResponse error: $e");
    }
  }

  final _androidGeneralChannelNotificationDetail =
      const AndroidNotificationDetails(
    'GENERAL',
    'Umum',
    channelDescription: 'Notifikasi Umum',
    importance: Importance.max,
    priority: Priority.high,
  );
  final DarwinNotificationDetails _darwinNotificationDetails =
      const DarwinNotificationDetails(
    threadIdentifier: 'GENERAL',
  );

  Future<void> showGeneralNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) {
    return localNotificationPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: _androidGeneralChannelNotificationDetail,
        iOS: _darwinNotificationDetails,
      ),
      payload: json.encode({
        "title": title,
        "body": body,
        "payload": payload,
      }),
    );
  }
}
