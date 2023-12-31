import 'package:chat_app/common/widgets/error.dart';
import 'package:chat_app/features/auth/screens/login_screen.dart';
import 'package:chat_app/features/auth/screens/otp_screen.dart';
import 'package:chat_app/features/auth/screens/user_infomation_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) {
          return OTPScreen(verificationId: verificationId);
        },
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const UserInformationScreen();
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
