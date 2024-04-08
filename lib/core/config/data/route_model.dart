import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteModel {
  Type screenType;
  Transition? transition;
  Widget Function(BuildContext context) page;
  bool isFirstRoute;

  String get fullPath {
    if (isFirstRoute && transition == null) {
      return '/';
    } else {
      if (transition != null) {
        return '/${screenType}_$transition';
      } else {
        return '/$screenType';
      }
    }
  }

  RouteModel({
    required this.screenType,
    required this.page,
    this.transition,
    this.isFirstRoute = false,
  });

  RouteModel copyWith({Transition? transition}) {
    return RouteModel(
      screenType: screenType,
      page: page,
      transition: transition ?? this.transition,
    );
  }
}