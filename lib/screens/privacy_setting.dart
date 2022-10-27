import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';
import 'package:test1/widgets/custom_appbar.dart';
import 'package:test1/widgets/setting_listtile.dart';

class PrivacySettingScreen extends StatefulWidget {
  const PrivacySettingScreen({Key? key}) : super(key: key);

  @override
  State<PrivacySettingScreen> createState() => _PrivacySettingScreenState();
}

class _PrivacySettingScreenState extends State<PrivacySettingScreen> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(context: context, title: 'Privacy'),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SettingListTile(
              title: 'Blocked contacts',
              icon: Icon(Icons.block),
              suffixIcon: Icons.chevron_right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      isExpand = !isExpanded;
                    });
                  },
                  animationDuration: const Duration(milliseconds: 500),
                  elevation: 0,
                  children: [
                    ExpansionPanel(
                        canTapOnHeader: true,
                        backgroundColor: AppTheme.bgColor,
                        isExpanded: isExpand,
                        headerBuilder: (context, isExpanded) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.language,
                                color: AppTheme.iconColor,
                              ),
                              Text(
                                'Who can send you contact \n request?',
                                maxLines: 2,
                                style: TextStyle(
                                    color: AppTheme.iconColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          );
                        },
                        body: Container(
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.',
                            maxLines: 10,
                            style: TextStyle(
                                color: AppTheme.iconColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
