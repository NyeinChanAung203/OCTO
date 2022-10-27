import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';

class FavoriteListTile extends StatelessWidget {
  const FavoriteListTile(
      {Key? key, required this.imageUrl, required this.name, this.onTap})
      : super(key: key);

  final String imageUrl;
  final String name;
  final VoidCallback? onTap;

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
        trailing: const Icon(
          Icons.favorite,
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }
}
