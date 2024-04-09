import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_app/core/config/others/app_shared.dart';
import 'package:flutter_starter_app/core/config/others/get_it_extension.dart';
import 'package:flutter_starter_app/core/config/others/get_page_route_utility.dart';
import 'package:flutter_starter_app/core/notification/domain/service/notification_service.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final getIt = AppShared.I.getIt;

  @override
  void initState() {
    log("app initState");
    super.initState();
    getIt.get<NotificationService>().onTapForegroundNotificationClicked.listen((message) {
      log("app message: ${message.toJson()}");
    });
  }

  @override
  void dispose() {
    log("app dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.key,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      getPages: GetPageRouteUtility.generateRoute(context,
          routes: AppShared.I.routes),
      initialRoute: GetPageRouteUtility.getInitialRoute(AppShared.I.routes),
    );
  }
}
