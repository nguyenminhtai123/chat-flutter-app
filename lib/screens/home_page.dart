import 'package:chat_app/screens/calls.dart';
import 'package:chat_app/screens/chats.dart';
import 'package:chat_app/screens/people.dart';
import 'package:chat_app/screens/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "/home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ChatsScreen(),
    CallsScreen(),
    PeopleScreen(),
    SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(Icons.phone),
          ),
          BottomNavigationBarItem(
            label: "People",
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF08C187),
        onTap: _onItemTapped,
      ),
      // tabBuilder: (BuildContext context, int index) {
      //   return screens[index];
      // },
    );
  }
}
