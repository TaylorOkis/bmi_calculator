import 'package:bmi_calculator/screens/home_screen/home_screen.dart';
import 'package:bmi_calculator/screens/result_screen/result_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/result':
        final List<dynamic> args = settings.arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (context) => ResultScreen(
            bmi: args[0],
            bmiComment: args[1],
            gender: args[2],
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text(
            'Page not found!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
