import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/features/chat/ui/page/chatPage.dart';
import 'package:flutter_dating_cdcnpm/features/home/ui/page/homepage.dart';
import 'package:flutter_dating_cdcnpm/features/profile/ui/page/setting.dart';
import 'package:flutter_dating_cdcnpm/features/signin/ui/page/signin.dart';
import 'package:flutter_dating_cdcnpm/features/signin/ui/page/signup.dart';
import 'package:flutter_dating_cdcnpm/features/splash/ui/page/splash.dart';
import 'package:flutter_dating_cdcnpm/features/tab/tabBar.dart';

class Routers {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'SplashPage':
        return MaterialPageRoute(builder: (context) => SplashPage());
      case 'LoginPage':
        return MaterialPageRoute(builder: (context) => SignInPage());
      case 'RegistrationPage':
        return MaterialPageRoute(builder: (context) => RegistrationPage());
      case 'CurvedNavigationBarWidget':
        return MaterialPageRoute(
            builder: (context) => CurvedNavigationBarWidget());
      case 'HomePage':
        return MaterialPageRoute(builder: (context) => HomePage());
      case 'ChatPage':
        return MaterialPageRoute(builder: (context) => ChatPage());
      case 'SettingPage':
        return MaterialPageRoute(builder: (context) => SettingPage());
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
