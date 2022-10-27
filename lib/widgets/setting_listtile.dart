import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile(
      {Key? key,
      this.onTap,
      required this.title,
      this.icon,
      this.suffixIcon,
      this.action})
      : super(key: key);

  final String title;
  final Widget? action;
  final Icon? icon;
  final VoidCallback? onTap;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppTheme.bgColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon ?? const SizedBox(),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: AppTheme.iconColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                action ??
                    Icon(
                      suffixIcon,
                      color: AppTheme.iconColor,
                    )
              ],
            ),
          ),
        ));
  }
}
