import 'package:flutter/material.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/shared/image_url.dart';
import 'package:test1/shared/theme.dart';
import 'package:test1/widgets/custom_appbar.dart';
import 'package:test1/widgets/setting_listtile.dart';

class SettinScreen extends StatelessWidget {
  const SettinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //appBar
              CustomAppBar(
                context: context,
                title: 'Setting',
                action: IconButton(
                  icon: const Icon(
                    Icons.mode_night_rounded,
                    color: AppTheme.primaryColor,
                  ),
                  splashRadius: 20,
                  onPressed: () {},
                ),
              ),

              // body Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // Profile Pic
                      Center(
                        child: SizedBox(
                          // color: Colors.amber,
                          width: 110,
                          height: 110,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage(AssetImageUrl.avatarFour),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: -1,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: AppTheme.bgColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 16,
                                      color: AppTheme.iconColor,
                                    ),
                                    splashRadius: 14,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Acc Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Nyein Chan Aung',
                            style: TextStyle(
                                color: AppTheme.titleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppTheme.bgColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.edit,
                                size: 16,
                                color: AppTheme.iconColor,
                              ),
                              splashRadius: 14,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // setting listtile
                      SettingListTile(
                        title: 'Account Setting',
                        icon: const Icon(
                          Icons.manage_accounts,
                          size: 30,
                          color: AppTheme.iconColor,
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.accountSetting);
                        },
                        suffixIcon: Icons.chevron_right,
                      ),
                      SettingListTile(
                        title: 'Favorites',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.favoriteSetting);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          size: 30,
                          color: AppTheme.iconColor,
                        ),
                        suffixIcon: Icons.chevron_right,
                      ),
                      SettingListTile(
                        title: 'Notifications',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.notificationSetting);
                        },
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: AppTheme.iconColor,
                        ),
                        suffixIcon: Icons.chevron_right,
                      ),
                      SettingListTile(
                        title: 'Privacy',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.privacySetting);
                        },
                        icon: const Icon(
                          Icons.security_outlined,
                          size: 30,
                          color: AppTheme.iconColor,
                        ),
                        suffixIcon: Icons.chevron_right,
                      ),
                      SettingListTile(
                        title: 'Language',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.languageSetting);
                        },
                        icon: const Icon(
                          Icons.language,
                          size: 30,
                          color: AppTheme.iconColor,
                        ),
                        suffixIcon: Icons.chevron_right,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20, top: 60),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppTheme.warningColor)),
                              onPressed: () {},
                              child: const Text('Log out',
                                  style: TextStyle(
                                    color: AppTheme.bgColor,
                                  ))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
