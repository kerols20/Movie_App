import 'package:flutter/material.dart';
import 'package:movie_app/core/app_routs/routes_name.dart';
import '../../presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../presentation/on_boarding/viwe/on_boarding.dart';
abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.bottomNavigationBar:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigationBarScreen(),
        );
        case RoutesName.onBoardingScreen:
          return MaterialPageRoute(
            builder: (context) => const OnBoardingView(),
          );
        default:
    }
    return null;
  }
}
