import 'package:permission_handler/permission_handler.dart';

abstract class PlatformRepository {
  Future<PermissionStatus> getPermissionStatus(Permission permission);

  Future<PermissionStatus> requestPermission(Permission permission);
}
