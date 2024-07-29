import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/home/presentation/screens/home_screen.dart';

class Routes {
  Routes._();

  static const String splash = "/splash";
  static const String home = "/home";

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
  };
}
