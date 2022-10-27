import 'package:flutter/material.dart';
import 'package:test1/model/user_model.dart';

import 'package:test1/shared/theme.dart';
import 'package:test1/widgets/custom_appbar.dart';
import 'package:test1/widgets/setting_listtile.dart';

class AccDetailScreen extends StatelessWidget {
  AccDetailScreen({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  final ValueNotifier<bool> noti = ValueNotifier(false);

  void changeNoti(bool value) {
    noti.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //appBar
          CustomAppBar(context: context, title: 'Details'),

          // body
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Profile Picture
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(userModel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Account Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        userModel.name,
                        style: const TextStyle(
                            color: AppTheme.titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '(nick name)',
                        style: TextStyle(
                            color: AppTheme.secondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // setting listtile
                  SettingListTile(
                    title: "Nickname",
                    onTap: () {
                      debugPrint('Clicked');
                    },
                    suffixIcon: Icons.edit,
                  ),
                  const SettingListTile(
                    title: "Add to favorite",
                    suffixIcon: Icons.favorite_border,
                  ),
                  const SettingListTile(
                    title: "Block",
                    suffixIcon: Icons.block,
                  ),
                  SettingListTile(
                    title: "Notification",
                    action: ValueListenableBuilder(
                      valueListenable: noti,
                      builder: (BuildContext context, bool value, child) {
                        return Switch(
                          inactiveThumbColor: AppTheme.iconColor,
                          activeColor: AppTheme.primaryColor,
                          onChanged: changeNoti,
                          value: value,
                        );
                      },
                    ),
                  ),
                  const SettingListTile(
                    title: "Search in conversation",
                    suffixIcon: Icons.search,
                  ),
                  const SettingListTile(
                    title: "Delete conversation",
                    suffixIcon: Icons.delete_forever_outlined,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
