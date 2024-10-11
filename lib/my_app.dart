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
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}
