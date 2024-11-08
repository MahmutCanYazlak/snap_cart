import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snap_cart/core/service/local/hive_database_service.dart';
import 'package:snap_cart/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveDatabaseService hiveDatabaseService = HiveDatabaseService.instance;
  String? username = await hiveDatabaseService.getData("auth", "username");
  String? password = await hiveDatabaseService.getData("auth", "password");

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      ProviderScope(
        child: MyApp(
          username: username,
          password: password,
        ),
      ),
    );
  });
}
