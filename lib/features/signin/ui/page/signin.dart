import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/features/home/resources/data.dart';
import 'package:flutter_dating_cdcnpm/routes/route_name.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In'),
            OutlinedButton(
              //style: outlineButtonStyle,
              onPressed: () {
                Navigator.pushNamed(context, RouteName.homePage);
              },
              child: Text('Looks like an OutlineButton'),
            )
          ],
        ),
      ),
    );
  }
}
