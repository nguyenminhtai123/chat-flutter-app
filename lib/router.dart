import 'package:chat_app/common/widgets/error.dart';
import 'package:chat_app/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      );
    default:
      return MaterialPageRoute(
        builder: (ctx) => const Scaffold(
          body: ErrorScreen(
            error: "This page does not exist",
          ),
        ),
      );
  }
}
