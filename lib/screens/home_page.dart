import 'package:chat_app/screens/calls.dart';
import 'package:chat_app/screens/chats.dart';
import 'package:chat_app/screens/people.dart';
import 'package:chat_app/screens/settings.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screens = [
      const ChatsScreen(),
      const CallsScreen(),
      const PeopleScreen(),
      const SettingsScreen(),
    ];
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(
                CupertinoIcons.chat_bubble_2_fill,
              ),
            ),
            BottomNavigationBarItem(
              label: "Calls",
              icon: Icon(
                CupertinoIcons.phone,
              ),
            ),
            BottomNavigationBarItem(
              label: "People",
              icon: Icon(
                CupertinoIcons.person_alt_circle,
              ),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(
                CupertinoIcons.settings_solid,
              ),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return screens[index];
        },
      ),
    );
  }
}
