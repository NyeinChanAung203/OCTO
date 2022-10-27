import 'package:flutter/material.dart';
import 'package:test1/shared/image_url.dart';
import 'package:test1/widgets/chat_listtile.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          ChatListTile(
              date: DateTime.now(),
              imageUrl: AssetImageUrl.avatarTwo,
              name: "Students",
              message: 'Hello my classmates'),
          ChatListTile(
              date: DateTime.now(),
              imageUrl: AssetImageUrl.avatarTwo,
              name: "Bad Boy Fighters",
              message:
                  'Hello my bads boys fighters LOL Hello my bads boys fighters LOL'),
          ChatListTile(
              date: DateTime.now(),
              imageUrl: AssetImageUrl.avatarFive,
              name: "My Brothers",
              message: 'Hello my brothres'),
        ],
      ),
    );
  }
}
