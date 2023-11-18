import 'package:chat_app/core/constant/color.dart';
import 'package:chat_app/dummy_data.dart';
import 'package:chat_app/screens/chat.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dummyData.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      dummyData[index]['name'].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        dummyData[index]['message'].toString(),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        dummyData[index]['ProfilePic'].toString(),
                      ),
                      radius: 30,
                    ),
                    trailing: Text(
                      dummyData[index]['time'].toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: ColorPalette.dividerColor,
                indent: 85,
              )
            ],
          );
        },
      ),
    );
  }
}
