import 'package:flutter_starter_app/core/config/data/route_model.dart';
import 'package:get/get.dart';

class AppShared {
  AppShared._();

  static AppShared? _instance;

  factory AppShared() => _instance ??= AppShared._();

  factory AppShared.newInstance() => _instance ??= AppShared._();

  static AppShared get I => AppShared();

  static AppShared get instance => AppShared();

  List<RouteModel> routes = [];

  void addRoute(RouteModel p) {
    final transitions = <Transition>[
      Transition.fade,
      Transition.fadeIn,
      Transition.rightToLeft,
      Transition.leftToRight,
      Transition.upToDown,
      Transition.downToUp,
      Transition.rightToLeftWithFade,
      Transition.leftToRightWithFade,
      Transition.zoom,
      Transition.topLevel,
      Transition.noTransition,
      Transition.cupertino,
      Transition.cupertinoDialog,
      Transition.size,
      Transition.circularReveal,
      Transition.native,
    ];
    routes.add(p);
    for (var t in transitions) {
      routes.add(p.copyWith(transition: t));
    }
  }
}
