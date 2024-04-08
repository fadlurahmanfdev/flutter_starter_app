import 'package:flutter/material.dart';
import 'package:flutter_starter_app/core/config/presentation/base_layout.dart';
import 'package:flutter_starter_app/features/example/data/feature_model.dart';
import 'package:flutter_starter_app/features/example/presentation/notification/example_notification_screen.dart';
import 'package:flutter_starter_app/features/example/presentation/widget/feature_widget.dart';

class ExampleFeaturesScreen extends StatefulWidget {
  const ExampleFeaturesScreen({super.key});

  @override
  State<ExampleFeaturesScreen> createState() => _ExampleFeaturesScreenState();
}

class _ExampleFeaturesScreenState extends State<ExampleFeaturesScreen>
    with BaseLayout {
  List<FeatureModel> features = [
    FeatureModel(
      title: 'Notification',
      desc: 'List of Notification Feature',
      key: 'NOTIFICATION',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Feature'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return GestureDetector(
            onTap: () async {
              switch (feature.key) {
                case 'NOTIFICATION':
                  navigator.push(ExampleNotificationScreen);
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
