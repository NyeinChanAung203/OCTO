import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';
import 'package:test1/widgets/custom_appbar.dart';
import 'package:test1/widgets/setting_listtile.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
          child: Column(
        children: [
          // appBar
          CustomAppBar(
            context: context,
            title: 'Account Setting',
          ),
          const SizedBox(
            height: 20,
          ),

          // body
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SettingListTile(
                        icon: const Icon(Icons.email),
                        title: 'Change Email',
                        suffixIcon: Icons.chevron_right,
                        onTap: () {
                          debugPrint('change email');
                        },
                      ),
                      SettingListTile(
                        icon: const Icon(Icons.key),
                        title: 'Change Password',
                        suffixIcon: Icons.chevron_right,
                        onTap: () {
                          debugPrint('change password');
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Forgot your current password?',
                              style: TextStyle(color: AppTheme.iconColor)),
                          TextButton(
                              onPressed: () {},
                              child: const Text('Reset Password'))
                        ],
                      )
                    ],
                  ),

                  // Delete Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppTheme.warningColor)),
                      onPressed: () {},
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(
                          color: AppTheme.bgColor,
                        ),
                      ),
                    ),
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
