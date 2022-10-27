import 'package:flutter/material.dart';
import 'package:test1/shared/image_url.dart';
import 'package:test1/shared/theme.dart';

import 'package:test1/widgets/custom_appbar.dart';
import 'package:test1/widgets/favorite_listtile.dart';

class FavoriteSettingScreen extends StatelessWidget {
  const FavoriteSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(context: context, title: "Favorites"),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppTheme.bgColor,
                  border:
                      Border.all(color: AppTheme.secondaryColor, width: 0.001),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppTheme.iconColor,
                      size: 22,
                    ),
                    hintText: 'Search Favorite Contact',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: AppTheme.secondaryColor,
                        textBaseline: TextBaseline.ideographic),
                    border: InputBorder.none,
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: 22,
              itemBuilder: (context, index) {
                return FavoriteListTile(
                    onTap: () {},
                    imageUrl: AssetImageUrl.avatarFive,
                    name: "Ochitsuita Ame");
              },
            ),
          ))
        ],
      )),
    );
  }
}
