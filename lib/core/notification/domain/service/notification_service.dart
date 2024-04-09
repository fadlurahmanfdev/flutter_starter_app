import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;

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
      if (payload == null) return;
      final decodedPayload = json.decode(payload) as Map<String, dynamic>;
      final message = LocalNotificationMessageModel.fromJson(decodedPayload);
      _onTapForegroundNotificationClicked.sink.add(message);
    } on Exception catch (e) {
      log("onDidReceiveNotificationResponse error: $e");
    }
  }

  Future<void> showGeneralNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    return localNotificationPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: await _getAndroidGeneralNotificationDetails(),
        iOS: await _getIOSGeneralNotificationDetails(),
      ),
      payload: json.encode({
        "title": title,
        "body": body,
        "payload": payload,
      }),
    );
  }

  Future<void> showNetworkImageNotification({
    required int id,
    required String title,
    required String body,
    required String imageUrl,
    Map<String, dynamic>? payload,
  }) async {
    return localNotificationPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android:
            await _getAndroidGeneralNotificationDetails(networkImage: imageUrl),
        iOS: await _getIOSGeneralNotificationDetails(networkImage: imageUrl),
      ),
      payload: json.encode({
        "title": title,
        "body": body,
        "payload": payload,
      }),
    );
  }

  Future<AndroidNotificationDetails> _getAndroidGeneralNotificationDetails({
    String? networkImage,
  }) async {
    BigPictureStyleInformation? bigPictureStyleInformation;
    AndroidBitmap<Object>? largeIcon;
    if (networkImage != null) {
      try {
        final response = await http.get(Uri.parse(networkImage));
        final image = ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(response.bodyBytes),
        );
        largeIcon = image;
        bigPictureStyleInformation = BigPictureStyleInformation(
          image,
          largeIcon: image,
          hideExpandedLargeIcon: true,
        );
      } catch (e) {
        log('error fetch image notification: $e');
      }
    }

    return AndroidNotificationDetails(
      'GENERAL',
      'Umum',
      channelDescription: 'Notifikasi Umum',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
      largeIcon: largeIcon,
    );
  }

  Future<DarwinNotificationDetails> _getIOSGeneralNotificationDetails({
    String? networkImage,
  }) async {
    final dir = await path_provider.getTemporaryDirectory();
    List<DarwinNotificationAttachment>? attachments;
    if (networkImage != null) {
      try {
        var filename =
            '${dir.path}/ios_notification_${DateTime.now().millisecond}.png';
        final response = await http.get(Uri.parse(networkImage));
        final file = File(filename);
        await file.writeAsBytes(response.bodyBytes);
        attachments = [
          DarwinNotificationAttachment(filename),
        ];
      } catch (e) {
        log('error fetch image notification: $e');
      }
    }

    return DarwinNotificationDetails(
      threadIdentifier: 'GENERAL',
      attachments: attachments,
    );
  }
}
