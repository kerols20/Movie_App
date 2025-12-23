import 'package:flutter/material.dart';
import 'package:movie_app/core/app_routs/routes_name.dart';
import '../../auth/forget_password/view/forget_password_view.dart';
import '../../auth/login/view/login_view.dart';
import '../../auth/register/view/register_view.dart';
import '../../presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../presentation/on_boarding/viwe/on_boarding.dart';
abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.bottomNavigationBar:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigationBarScreen(),
        );
        case RoutesName.forgetPassword:
          return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView(),
          );
        case RoutesName.register:
          return MaterialPageRoute(
            builder: (context) => const RegisterView(),
          );
          case RoutesName.login:
          return MaterialPageRoute(
            builder: (context) => const LoginView(),
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
