import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/features/signin/ui/page/signin.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new SignInPage(),
      title: new Text(
        'Datinn',
        style: new TextStyle(
            fontWeight: FontWeight.w700, fontSize: 30.0, color: Colors.blue),
      ),
      photoSize: 60.0,
      image: new Image.asset("assets/images/splash.png"),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
