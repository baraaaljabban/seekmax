import 'package:flutter/material.dart';
import 'package:seekmax/core/navigation/nav_args.dart';
import 'package:seekmax/features/home/presentation/pages/home_page.dart';
import 'package:seekmax/features/job_details/presentation/pages/job_details.dart';
import 'package:seekmax/features/login/presentation/pages/login_page.dart';
import 'package:seekmax/features/start_up/presentation/pages/start_up_page.dart';

class NavRouter {
  NavRouter._();

  static const String initialRoute = '/';
  static const String landingRoute = '/home';
  static const String loginRoute = '/login';
  static const String userProfile = '/userProfile';
  static const String jobDetails = '/jobDetails';

  static MaterialPageRoute _pageRoute(Widget page, settings, {bool fullscreenDialog = false}) {
    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _pageRoute(
          const StartUpPage(),
          settings,
        );

      case loginRoute:
        return _pageRoute(
          const LoginPage(),
          settings,
        );
      case landingRoute:
        return _pageRoute(
          const HomePage(),
          settings,
        );
      case jobDetails:
        return _pageRoute(
          JobDetailsPage(jobDetailsArgs: settings.arguments as JobDetailsArgs),
          settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
