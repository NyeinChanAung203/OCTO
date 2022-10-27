import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';
import 'package:test1/widgets/custom_appbar.dart';
import 'package:test1/widgets/setting_listtile.dart';

class NotificationSettingScreen extends StatelessWidget {
  NotificationSettingScreen({Key? key}) : super(key: key);

  final ValueNotifier<bool> noti = ValueNotifier(true);
  final ValueNotifier<bool> vibrate = ValueNotifier(true);

  void changeNoti(bool value) {
    noti.value = value;
  }

  void changeVibrate(bool value) {
    vibrate.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.appBGColor,
        body: SafeArea(
            child: Column(
          children: [
            CustomAppBar(
              context: context,
              title: 'Notifications',
              action: ValueListenableBuilder(
                valueListenable: noti,
                builder: (BuildContext context, bool value, child) {
                  return Switch(value: value, onChanged: changeNoti);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SettingListTile(
                title: 'Ringtone',
                icon: Icon(Icons.notifications),
                suffixIcon: Icons.chevron_right,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SettingListTile(
                icon: const Icon(Icons.vibration),
                title: "Vibrate on ring",
                action: ValueListenableBuilder(
                  valueListenable: vibrate,
                  builder: (BuildContext context, bool value, child) {
                    return Switch(value: value, onChanged: changeVibrate);
                  },
                ),
              ),
            )
          ],
        )));
  }
}
