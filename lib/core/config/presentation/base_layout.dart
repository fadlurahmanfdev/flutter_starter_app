import 'package:flutter_starter_app/core/config/others/app_shared.dart';
import 'package:flutter_starter_app/core/config/others/navigator_utility.dart';

mixin BaseLayout {
  final navigator = NavigatorUtility.I;
  final getIt = AppShared.I.getIt;
}
