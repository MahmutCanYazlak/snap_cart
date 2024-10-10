import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  PermissionUtils._();
}

Future<PermissionStatus> permissionChecker() async {
  return await Permission.storage.request();
}

