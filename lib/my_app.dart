import 'package:flutter/material.dart';
import 'package:snap_cart/config/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
