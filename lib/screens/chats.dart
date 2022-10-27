import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/provider/usermodel_provider.dart';
import 'package:test1/routes/routes.dart';

import 'package:test1/widgets/chat_listtile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chats = Provider.of<UserModelMessageProvider>(context).chats;
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 30, top: 20),
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatListTile(
            date: chats[index].messages.last.date,
            imageUrl: chats[index].imageUrl,
            name: chats[index].name,
            message: chats[index].messages.last.text,
            onTap: () {
              Navigator.of(context)
                  .pushNamed(Routes.chatDetail, arguments: chats[index]);
            },
          );
        },
      ),
    );
  }
}
