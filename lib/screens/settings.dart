import 'package:chat_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Future<LoginScreen> _signOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamed(LoginScreen.routeName);
      return LoginScreen();
    }

    return Scaffold(
        body: Center(
            child: IconButton(
      onPressed: _signOut,
      icon: Icon(Icons.logout),
    )));
  }
}
