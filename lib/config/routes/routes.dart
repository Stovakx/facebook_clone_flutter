import 'package:facebook_clone_flutter/screens/error_screen.dart';
import 'package:facebook_clone_flutter/screens/home_screen.dart';
import 'package:facebook_clone_flutter/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return _cupertinoRoute(const HomeScreen());
      case RegisterScreen.routeName:
        return _cupertinoRoute( const RegisterScreen());
      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: 'Wrong Route provided ${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(
        builder: (_) => view,
      );

  Routes._();
}