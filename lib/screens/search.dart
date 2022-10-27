import 'package:flutter/material.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/shared/dummy_data.dart';
import 'package:test1/shared/image_url.dart';
import 'package:test1/shared/theme.dart';
import 'package:test1/widgets/chat_listtile.dart';
import 'package:test1/widgets/contact_listtile.dart';

import 'package:test1/widgets/search_appbar.dart';
import 'package:test1/widgets/subtitle_header.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
          child: Column(
        children: [
          SearchAppBar(context: context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: ListView(
                children: [
                  const SubTitleHeader(
                      title: 'Conversations', actionText: 'SEE MORE'),
                  ChatListTile(
                    date: DateTime.now(),
                    imageUrl: chatsDummy[0].imageUrl,
                    name: chatsDummy[0].name,
                    message: chatsDummy[0].messages.last.text,
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.chatDetail,
                          arguments: chatsDummy[0]);
                    },
                  ),
                  ChatListTile(
                    date: DateTime.now(),
                    imageUrl: chatsDummy[1].imageUrl,
                    name: chatsDummy[1].name,
                    message: chatsDummy[1].messages.last.text,
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.chatDetail,
                          arguments: chatsDummy[1]);
                    },
                  ),
                  ChatListTile(
                    date: DateTime.now(),
                    imageUrl: chatsDummy[2].imageUrl,
                    name: chatsDummy[2].name,
                    message: chatsDummy[2].messages.last.text,
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.chatDetail,
                          arguments: chatsDummy[2]);
                    },
                  ),
                  const SubTitleHeader(
                      title: 'Contacts', actionText: 'SEE MORE'),
                  const ContactListTile(
                      name: 'Thein Soe',
                      isRequest: false,
                      imageUrl: AssetImageUrl.avatarFive),
                  const ContactListTile(
                      name: 'Zwe Marn Oo',
                      isRequest: false,
                      imageUrl: AssetImageUrl.avatarFour),
                  const ContactListTile(
                      name: 'Kyaw Lin Naing',
                      isRequest: false,
                      imageUrl: AssetImageUrl.avatarThree),
                  const SubTitleHeader(title: 'Groups', actionText: 'SEE MORE'),
                  ChatListTile(
                      date: DateTime.now(),
                      imageUrl: AssetImageUrl.avatarOne,
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
            ),
          )
        ],
      )),
    );
  }
}
