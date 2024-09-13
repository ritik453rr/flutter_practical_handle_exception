import 'package:exceptions_handle/utils/routes/routes_name.dart';
import 'package:exceptions_handle/view/home_screen.dart';
import 'package:exceptions_handle/view/login_screen.dart';
import 'package:exceptions_handle/view/signup_view.dart';
import 'package:exceptions_handle/view/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

        case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );
        case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No route defined"),
              ),
            );
          },
        );
    }
  }
}
