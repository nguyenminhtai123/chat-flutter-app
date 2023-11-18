// ignore_for_file: overridden_fields, annotate_overrides, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:chat_app/core/constant/color.dart';
import 'package:chat_app/features/landing/screens/landing_screen.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorPalette.backgroundColor,
        appBarTheme: const AppBarTheme(
          color: ColorPalette.appBarColor,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LandingScreen(),
    ),
  );
}
