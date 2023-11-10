import 'package:chat_app/bloc/auth_bloc.dart';
import 'package:chat_app/helper/colorPlallete.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/loading_dialog.dart';
import 'package:chat_app/widgets/msg_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "/login-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthBloc authBloc = AuthBloc();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onClickLogin() {
    String email = _emailController.text;
    String pass = _passwordController.text;
    var authBloc = MyApp.of(context)?.bloc;
    LoadingDialog.showLoadingDialog(context, 'Loading...');
    authBloc?.signIn(
      email,
      pass,
      () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.of(context).pushNamed(HomePage.routeName);
      },
      (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog(context, 'Sign-In', msg);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: ColorPallete.headTitle,
                  ),
                ),
              ),
              const Text(
                'Login to continue using ChatsApp',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPallete.subTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.emailController,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailController,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
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
              ),
              StreamBuilder(
                stream: authBloc.passwordController,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText:
                          snapshot.hasError ? snapshot.error.toString() : null,
                      prefixIcon: const SizedBox(
                          width: 50, child: Icon(CupertinoIcons.lock)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF08C187),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                constraints: BoxConstraints.loose(
                  const Size(
                    double.infinity,
                    30,
                  ),
                ),
                alignment: AlignmentDirectional.centerEnd,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorPallete.subTitle,
                    ),
                  ),
                ),
              ),
              ButtonWidget(
                title: 'Log in',
                onTap: onClickLogin,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: 'New User? ',
                    style: const TextStyle(
                        color: ColorPallete.subTitle, fontSize: 16),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName);
                          },
                        text: 'Sign up for a new account',
                        style: const TextStyle(
                          color: ColorPallete.linkTitle,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
