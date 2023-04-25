import 'package:flutter/material.dart';
import 'package:seekmax/features/app/presentation/pages/app.dart';
import 'package:seekmax/features/home/presentation/pages/home_page.dart';
import 'package:seekmax/features/login/presentation/pages/login_page.dart';

class NavRouter {
  NavRouter._();

  static const String initialRoute = '/';
  static const String landingRoute = '/home';
  static const String loginRoute = '/login';
  static const String userProfile = '/userProfile';
  static const String searchView = '/search_view';

  static MaterialPageRoute _pageRoute(Widget page, settings, {bool fullscreenDialog = false}) {
    return MaterialPageRoute(builder: (_) => page, settings: settings, fullscreenDialog: fullscreenDialog);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _pageRoute(
          AppPage(),
          settings,
        );
      case loginRoute:
        return _pageRoute(
          LoginPage(),
          settings,
        );
      case landingRoute:
        return _pageRoute(
          const HomePage(),
          settings,
        );
      // case userProfile:
      //   return _pageRoute(
      //     UserProfilePage(),
      //     settings,
      //   );

      // case searchView:
      //   return _pageRoute(
      //     Search(
      //       argument: settings.arguments as SearchScreenArgument,
      //     ),
      //     settings,
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
