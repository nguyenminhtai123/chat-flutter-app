import 'package:chat_app/bloc/auth_bloc.dart';
import 'package:chat_app/helper/colorPlallete.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/loading_dialog.dart';
import 'package:chat_app/widgets/msg_dialog.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = "/register-screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthBloc authBloc = AuthBloc();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  void onClickSignUp() {
    setState(
      () {
        if (authBloc.isValidInfo(_nameController.text, _emailController.text,
            _passwordController.text, _passwordConfirmController.text)) {
          LoadingDialog.showLoadingDialog(context, 'Loading...');
          authBloc.signUp(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
            _passwordConfirmController.text,
            () {
              LoadingDialog.hideLoadingDialog(context);
              Navigator.of(context).pushNamed(HomePage.routeName);
            },
            (msg) {
              LoadingDialog.hideLoadingDialog(context);
              MsgDialog.showMsgDialog(context, 'Sign-In', msg);
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 6),
              child: Text(
                "Let's Chat",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: ColorPallete.headTitle,
                ),
              ),
            ),
            const Text(
              'Signup with ChatsApp with simple steps',
              style: TextStyle(
                fontSize: 16,
                color: ColorPallete.subTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: StreamBuilder(
                stream: authBloc.nameController,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _nameController,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Name',
                      errorText:
                          snapshot.hasError ? snapshot.error.toString() : null,
                      prefixIcon: const SizedBox(
                        width: 50,
                        child: Icon(Icons.person),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF08C187),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            StreamBuilder(
              stream: authBloc.emailController,
              builder: (context, snapshot) {
                return TextField(
                  controller: _emailController,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    prefixIcon: const SizedBox(
                      width: 50,
                      child: Icon(Icons.mail),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF08C187),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: StreamBuilder(
                stream: authBloc.passwordController,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText:
                          snapshot.hasError ? snapshot.error.toString() : null,
                      prefixIcon: const SizedBox(
                        width: 50,
                        child: Icon(Icons.lock),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF08C187),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            StreamBuilder(
              stream: authBloc.passwordConfirmController,
              builder: (context, snapshot) {
                return TextField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    prefixIcon: const SizedBox(
                      width: 50,
                      child: Icon(Icons.lock),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF08C187),
                      ),
                    ),
                  ),
                );
              },
            ),
            ButtonWidget(
              title: 'Sign up',
              onTap: onClickSignUp,
              // onTap: onLoginClicked,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: RichText(
                text: TextSpan(
                  text: 'Already a User? ',
                  style: const TextStyle(
                      color: ColorPallete.subTitle, fontSize: 16),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                      text: 'Login Now',
                      style: const TextStyle(
                        color: ColorPallete.linkTitle,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
