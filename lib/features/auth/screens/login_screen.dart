import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/core/constant/color.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Enter your phone number",
        ),
        elevation: 0,
        backgroundColor: ColorPalette.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('FastChat will need to verify your phone number'),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: pickCountry,
              child: const Text(
                'Pick Country',
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                if (country != null)
                  Text(
                    '+${country!.phoneCode}',
                    style: TextStyle(fontSize: 16),
                  ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(hintText: 'Phone Number'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.55,
            ),
            SizedBox(
                width: 90,
                child: CustomButton(
                  onPressed: () {},
                  title: "NEXT",
                ))
          ],
        ),
      ),
    );
  }
}
