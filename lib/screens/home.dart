import 'package:flutter/material.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/screens/chats.dart';
import 'package:test1/screens/contacts.dart';
import 'package:test1/screens/groups.dart';
import 'package:test1/shared/theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> index = ValueNotifier(1);

  void changeIndex(int value) {
    index.value = value;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuilding');
    List<Widget> items = [
      const GroupsScreen(),
      const ChatScreen(),
      const ContactsScreen(),
    ];
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: index,
              builder: (BuildContext context, int index, child) {
                return Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    children: [createAppBar(context), items[index]],
                  ),
                );
              })),
      bottomNavigationBar: createBottomNavBar(),
      floatingActionButton: createFABtn(),
    );
  }

  SizedBox createAppBar(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.search);
          },
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                color: AppTheme.bgColor,
                border:
                    Border.all(color: AppTheme.secondaryColor, width: 0.001),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                enabled: false,
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.privacySetting);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppTheme.iconColor,
                    size: 25,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      fontSize: 14.5,
                      color: AppTheme.secondaryColor,
                      textBaseline: TextBaseline.ideographic),
                  isDense: true,
                  border: InputBorder.none,
                ),
              )),
        )),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.setting);
          },
          icon: const Icon(
            Icons.settings,
            color: AppTheme.iconColor,
          ),
          splashRadius: 20,
        )
      ]),
    );
  }

  ValueListenableBuilder<int> createFABtn() {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (BuildContext context, int value, child) {
        return FloatingActionButton(
          onPressed: () {},
          child: value == 1
              ? const Icon(Icons.mark_chat_unread_rounded)
              : value == 0
                  ? const Icon(Icons.group_add)
                  : const Icon(Icons.group_add_outlined),
        );
      },
    );
  }

  ValueListenableBuilder<int> createBottomNavBar() {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (BuildContext context, int index, child) {
        return Container(
          decoration: const BoxDecoration(
            color: AppTheme.bgColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              onTap: changeIndex,
              currentIndex: index,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: AppTheme.bgColor,
              selectedItemColor: AppTheme.primaryColor,
              unselectedItemColor: AppTheme.iconColor,
              iconSize: 28,
              unselectedFontSize: 14,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.groups), label: 'Groups'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_rounded), label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: 'Contacts'),
              ],
            ),
          ),
        );
      },
    );
  }
}
