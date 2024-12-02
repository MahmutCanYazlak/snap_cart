import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:snap_cart/features/order/screens/order_details.dart';

import '../../../config/constants/app_constants/duration_constants.dart';
import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../../auth/screens/login.dart';
import '../../home/screens/home.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  Widget? _child;
  @override
  void initState() {
    _child = const Home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _child,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
            svgPath: ImageConstants.home.getSvg,
            extras: {"label": "home"},
          ),
          FluidNavBarIcon(
              svgPath: ImageConstants.search.getSvg,
              extras: {"label": "search"}),
          FluidNavBarIcon(
            svgPath: ImageConstants.buy.getSvg,
            extras: {"label": "buy"},
          ),
          FluidNavBarIcon(
              svgPath: ImageConstants.icons.getSvg,
              extras: {"label": "profile"}),
        ],
        onChange: handleNavigationChange,
        style: const FluidNavBarStyle(
            iconUnselectedForegroundColor: AppColors.grayColor,
            barBackgroundColor: AppColors.bottomNavbarColor),
        scaleFactor: 1.5,
        defaultIndex: 0,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }

  void handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const Home();
          break;
        case 1:
          _child = const Login();
          break;
        case 2:
          _child = const OrderDetails();
          break;
        case 3:
          _child = const Login();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: DurationConstants.veryShort(),
        child: _child,
      );
    });
  }
}
