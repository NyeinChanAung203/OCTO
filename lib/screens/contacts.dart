import 'package:flutter/material.dart';
import 'package:test1/shared/image_url.dart';

import 'package:test1/widgets/contact_listtile.dart';
import 'package:test1/widgets/subtitle_header.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          SubTitleHeader(title: 'Contact requests', actionText: 'SEE MORE'),
          ContactListTile(
              name: 'Senpai',
              isRequest: true,
              imageUrl: AssetImageUrl.avatarTwo),
          ContactListTile(
              name: 'Ochitsuita Ame',
              isRequest: true,
              imageUrl: AssetImageUrl.avatarThree),
          ContactListTile(
              name: 'Kaung Set Maung',
              isRequest: true,
              imageUrl: AssetImageUrl.avatarOne),
          SubTitleHeader(title: 'Contacts', actionText: 'SEE MORE'),
          ContactListTile(
              name: 'Thein Soe',
              isRequest: false,
              imageUrl: AssetImageUrl.avatarFive),
          ContactListTile(
              name: 'Zwe Marn Oo',
              isRequest: false,
              imageUrl: AssetImageUrl.avatarFour),
          ContactListTile(
              name: 'Kyaw Lin Naing',
              isRequest: false,
              imageUrl: AssetImageUrl.avatarThree),
        ],
      ),
    );
  }
}
