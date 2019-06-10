import 'package:flutter/material.dart';
import 'package:gframework/routes.dart';
import 'package:gframework/ui/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Login App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: routes,
      home: SplashScreen(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'CRS',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: MyHomePage(title: 'Customer Register System'),
  //   );
  // }
}
