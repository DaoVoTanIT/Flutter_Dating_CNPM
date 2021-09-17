import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/features/home/ui/page/homepage.dart';
import 'package:flutter_dating_cdcnpm/features/signin/ui/page/signin.dart';
import 'package:flutter_dating_cdcnpm/features/splash/ui/page/splash.dart';

class Routers {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'SplashPage':
        return MaterialPageRoute(builder: (context) => SplashPage());
      case 'LoginPage':
        return MaterialPageRoute(builder: (context) => SignInPage());
      case 'HomePage':
        return MaterialPageRoute(builder: (context) => HomePage());

      default:
        {
          return MaterialPageRoute(builder: (_) {
            return Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')));
          });
        }
    }
  }
}
