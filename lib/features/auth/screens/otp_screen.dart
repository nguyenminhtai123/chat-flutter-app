import 'package:chat_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.verificationId});
  static const String routeName = "/OTPScreen";
  final String verificationId;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Verifying your phonenumber",
          ),
          elevation: 0,
          backgroundColor: ColorPalette.backgroundColor,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("We have sent an SMS with a code."),
            SizedBox(
              width: size.width * 0.5,
              child: const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "- - - - - -",
                  hintStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
                keyboardType: TextInputType.number,
                // onChanged: (value) {

                // } ,
              ),
            )
          ],
        ));
  }
}
