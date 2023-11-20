// ignore_for_file: avoid_print

import 'package:chat_app/core/constant/color.dart';
import 'package:chat_app/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPScreen extends ConsumerWidget {
  const OTPScreen({super.key, required this.verificationId});
  static const String routeName = "/OTPScreen";
  final String verificationId;

  void verifyOTP(
    WidgetRef ref,
    BuildContext context,
    String userOTP,
  ) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Verifying your phonenumber",
          ),
          elevation: 0,
          backgroundColor: ColorPalette.backgroundColor,
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("We have sent an SMS with a code."),
              Container(
                width: size.width / 2,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "- - - - - -",
                    hintStyle: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if (val.length == 6) {
                      print("Verifying phone number");
                      verifyOTP(ref, context, val.trim());
                    }
                    print('this func was run');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
