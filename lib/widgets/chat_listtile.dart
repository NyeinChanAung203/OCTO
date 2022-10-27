import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';
import 'package:intl/intl.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.message,
      required this.date,
      this.onTap})
      : super(key: key);
  final String imageUrl;
  final String name, message;
  final VoidCallback? onTap;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        tileColor: AppTheme.bgColor,
        textColor: AppTheme.secondaryColor,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppTheme.titleColor),
        ),
        subtitle: Text(
          message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat.jm().format(date),
              style:
                  const TextStyle(fontSize: 11, color: AppTheme.secondaryColor),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '3',
                style: TextStyle(color: AppTheme.bgColor, fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
