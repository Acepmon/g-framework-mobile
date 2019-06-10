import 'package:gframework/ui/homeScreen.dart';
import 'package:gframework/ui/loginScreen.dart';
import 'package:flutter/material.dart';

final routes = {
  "/HomeScreen": (BuildContext context) => HomeScreen(),
  "/LoginScreen": (BuildContext context) => LoginScreen(),
  // '/login': (BuildContext context) => new LoginScreen(),
  // '/home': (BuildContext context) => new HomeScreen(),
  // '/': (BuildContext context) => new LoginScreen(),
};
