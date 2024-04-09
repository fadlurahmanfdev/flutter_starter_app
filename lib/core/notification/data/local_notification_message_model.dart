import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_notification_message_model.freezed.dart';
part 'local_notification_message_model.g.dart';

@freezed
class LocalNotificationMessageModel with _$LocalNotificationMessageModel {
  factory LocalNotificationMessageModel({
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) = _LocalNotificationMessageModel;

  factory LocalNotificationMessageModel.fromJson(Map<String, dynamic> json) =>
      _$LocalNotificationMessageModelFromJson(json);
}
