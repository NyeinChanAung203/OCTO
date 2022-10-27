import 'package:flutter/material.dart';
import 'package:test1/model/language_model.dart';
import 'package:test1/shared/theme.dart';
import 'package:test1/widgets/custom_appbar.dart';
import 'package:test1/widgets/setting_listtile.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  List<Languages> lanList = [
    Languages(name: "English", index: 1),
    Languages(name: "Burmese", index: 2),
    Languages(name: "Japan", index: 3),
    Languages(name: "Korea", index: 4),
    Languages(name: "China", index: 5),
  ];

  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(context: context, title: "Language"),
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
                    hintText: 'Search Language in English',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: AppTheme.secondaryColor,
                        textBaseline: TextBaseline.ideographic),
                    // isDense: true,
                    border: InputBorder.none,
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: lanList.length,
              itemBuilder: (context, index) {
                return SettingListTile(
                  title: lanList[index].name,
                  action: Radio(
                      value: lanList[index].index,
                      groupValue: id,
                      onChanged: (int? value) {
                        setState(() {
                          id = value ?? 1;
                        });
                      }),
                );
              },
            ),
          ))
        ],
      )),
    );
  }
}
