import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/routes/route_name.dart';
import 'package:flutter_dating_cdcnpm/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // appBarTheme: AppBarTheme(
        //     color: kPrimaryColorVariant,
        //     brightness: Brightness.light,
        //     elevation: 0.0,
        //     iconTheme: IconThemeData(color: Colors.black26)),
      ),
      //set up router

      initialRoute: RouteName.homePage,
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
