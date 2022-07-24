import 'package:flutter/material.dart';
import 'package:movie_app/Common/const.dart';

import '../Screens/home_screen.dart';
import '../Screens/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case splashScreenRoute:
            return const SplashScreen();
          case homeScreenRoute:
            return const HomeScreen();

          default:
            return Scaffold(
              body: Center(child: Text('No Route defind for ${settings.name}')),
            );
        }
      },
    );
  }
}
