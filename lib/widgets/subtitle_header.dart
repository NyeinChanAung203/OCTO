import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';

class SubTitleHeader extends StatelessWidget {
  const SubTitleHeader(
      {Key? key, required this.title, required this.actionText})
      : super(key: key);

  final String title, actionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: AppTheme.secondaryColor),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              actionText,
              style: const TextStyle(color: AppTheme.primaryColor),
            ))
      ],
    );
  }
}
