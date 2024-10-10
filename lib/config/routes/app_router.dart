import 'package:flutter/material.dart';

import '../../features/auth/view/login.dart';
import '../../features/bottomNavbar/view/bottom_navbar.dart';
import '../../features/product/screens/product_detail.dart';
import 'app_route_name.dart';


class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case RouteNames.bottomNavbar:
        return MaterialPageRoute(
          builder: (context) => const BottomNavbar(),
        );
      case RouteNames.productDetail:
        return MaterialPageRoute(
          builder: (context) => const ProductDetail(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
    }
  }
}
