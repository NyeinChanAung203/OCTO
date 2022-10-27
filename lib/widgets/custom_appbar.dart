import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.context,
    required this.title,
    this.action,
  }) : super(key: key);

  final BuildContext context;
  final String title;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: AppTheme.bgColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.3),
                offset: const Offset(0, 2),
                spreadRadius: 0.3,
                blurRadius: 10),
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: AppTheme.iconColor,
          ),
          splashRadius: 20,
        ),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            action ??
                const SizedBox(
                  width: 20,
                ),
            const SizedBox(width: 10)
          ],
        )
      ]),
    );
  }
}
