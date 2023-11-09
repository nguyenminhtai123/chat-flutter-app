// ignore_for_file: overridden_fields, annotate_overrides, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:chat_app/screens/home_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    const CupertinoApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF08C187),
      ),
      home: HomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(),
    );
  }
}
