import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/core/constant/color.dart';
import 'package:chat_app/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext ctx) {
    Navigator.pushNamed(ctx, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome to FirstChat",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            Image.asset(
              'assets/images/bg.png',
              height: 340,
              width: 340,
              color: ColorPalette.tabColor,
            ),
            SizedBox(
              height: size.height / 15,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Read our Privacy Policy. Tap 'Agree and continue' to accept the Term of Service.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                  title: "AGREE AND CONTINUE",
                  onPressed: () => navigateToLoginScreen(context)),
            )
          ],
        ),
      ),
    );
  }
}
