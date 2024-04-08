import 'package:flutter_starter_app/core/platform/repository/platform_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class PlatformRepositoryImpl extends PlatformRepository {
  @override
  Future<PermissionStatus> getPermissionStatus(Permission permission) {
    return permission.status;
  }

  @override
  Future<PermissionStatus> requestPermission(Permission permission) {
    return permission.request();
  }
}
