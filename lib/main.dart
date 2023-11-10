// ignore_for_file: overridden_fields, annotate_overrides, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:chat_app/bloc/auth_bloc.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/routes.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    AuthBloc(),
    MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF08C187),
      ),
      routes: routes,
      home: const LoginScreen(),
    ),
  ));
}

class MyApp extends InheritedWidget {
  final AuthBloc bloc;
  final Widget child;
  MyApp(this.bloc, this.child) : super(child: child);

  // This widget is the root of your application.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
