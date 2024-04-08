import 'package:flutter/material.dart';
import 'package:flutter_starter_app/core/config/data/route_model.dart';
import 'package:get/get.dart';

class GetPageRouteUtility {
  GetPageRouteUtility._();

  static List<GetPage> generateRoute(
    BuildContext context, {
    required List<RouteModel> routes,
  }) {
    return routes
        .map((e) => GetPage(
              name: e.fullPath,
              page: () => e.page(context),
              transition: e.transition,
            ))
        .toList();
  }

  static String getInitialRoute(List<RouteModel> routes) =>
      routes.firstWhere((element) => element.isFirstRoute).fullPath;
}
