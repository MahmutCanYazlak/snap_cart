import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/routes/app_route_name.dart';
import 'package:snap_cart/config/routes/app_router.dart';
import 'package:snap_cart/core/service/remote/api_service.dart';

import 'core/models/auth/user_model.dart';
import 'core/resources/data_state.dart';
import 'features/auth/controller/auth_controller.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key, this.username, this.password});
  final String? username;
  final String? password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (username != null && password != null) {
      return FutureBuilder<DataState<UserModel>>(
        future: ref.read(authControllerProvider).login(
              email: username ?? "",
              password: password ?? "",
            ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dataState = snapshot.data;
            final userData = dataState?.data;
            Future(() async {
              ref
                  .read(apiServiceNotifier)
                  .updateBearerToken(userData?.accessToken);
            });

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'SnapCart',
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                ),
                useMaterial3: true,
              ),
              onGenerateRoute: AppRouter.onGenerateRoutes,
              initialRoute: RouteNames.bottomNavbar,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            /// Yüklenirken gösterilecek kısım
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            /// Login işlemi gerçekleşmediğinde gerçekleşecek kısım
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'SnapCart',
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                ),
                useMaterial3: true,
              ),
              onGenerateRoute: AppRouter.onGenerateRoutes,
              initialRoute: RouteNames.login,
            );
          }
        },
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SnapCart',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
          ),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter.onGenerateRoutes,
        initialRoute: RouteNames.login,
      );
    }
  }
}
