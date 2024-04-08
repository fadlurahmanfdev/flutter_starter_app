import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_starter_app/core/config/others/wrapper_state.dart';
import 'package:flutter_starter_app/core/config/presentation/base_layout.dart';
import 'package:flutter_starter_app/core/notification/domain/repository/notification_repository.dart';
import 'package:flutter_starter_app/features/example/data/feature_model.dart';
import 'package:flutter_starter_app/features/example/presentation/widget/feature_widget.dart';

class ExampleNotificationScreen extends StatefulWidget with WrapperState {
  const ExampleNotificationScreen({super.key});

  @override
  State<ExampleNotificationScreen> createState() =>
      _ExampleNotificationScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _ExampleNotificationScreenState extends State<ExampleNotificationScreen>
    with BaseLayout {
  List<FeatureModel> features = [
    FeatureModel(
      title: 'Permission',
      desc: 'Ask Notification Permission',
      key: 'PERMISSION',
    ),
    FeatureModel(
      title: 'Notification',
      desc: 'Show Simple Notification',
      key: 'SHOW_NOTIFICATION',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Features'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return GestureDetector(
            onTap: () async {
              switch (feature.key) {
                case 'PERMISSION':
                  print("masuk isGranted: "
                      "${await getIt.get<NotificationRepository>().isPermissionGranted()}");
                  break;
                case 'SHOW_NOTIFICATION':
                  final id = Random().nextInt(999);
                  getIt.get<NotificationRepository>().showNotification(
                        id,
                        'Random Title: $id',
                        'Random Body: $id',
                      );
                  break;
                default:
                  break;
              }
            },
            child: ItemFeatureWidget(feature: feature),
          );
        },
      ),
    );
  }
}
