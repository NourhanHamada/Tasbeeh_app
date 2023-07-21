import 'package:flutter/material.dart';
import 'package:tasbeeh/view/screens/splash_screen.dart';

import '../constants/my_strings.dart';

class AppRoutes {
  Route ? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const SplashScreen();
        });
    }
    return null;
  }
}