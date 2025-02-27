import 'package:flutter/material.dart';
import 'package:mitaoe/auth/screens/signin_screen.dart';
import 'package:mitaoe/auth/screens/signup_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInScreen.routeName: // Use the static route name
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInScreen(),
      );

    case SignUpScreen.routeName: // Use the static route name
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );

    // case HomeScreen.routeName: // Use the static route name
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const HomeScreen(),
    //   );
      
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen doesn't exist!"),
          ),
        ),
      );
  }
}

Route<dynamic> _errorRoute(String message) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text('Error: $message'),
      ),
    ),
  );
}
