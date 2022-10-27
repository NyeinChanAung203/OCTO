import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';

class Signup extends StatelessWidget {
  Signup({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  final ValueNotifier<bool> isObsecurePassword = ValueNotifier(true);
  final ValueNotifier<bool> isObsecureCPassword = ValueNotifier(true);

  void changeObsecureP() {
    isObsecurePassword.value = !isObsecurePassword.value;
  }

  void changeObsecureCP() {
    isObsecureCPassword.value = !isObsecureCPassword.value;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build sign up');
    return Form(
        child: Column(
      children: [
        const TextField(
          decoration: InputDecoration(hintText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
        ),
        const SizedBox(
          height: 20,
        ),
        ValueListenableBuilder(
          valueListenable: isObsecurePassword,
          builder: (BuildContext context, bool value, child) {
            return TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: GestureDetector(
                    onTap: changeObsecureP,
                    child: Icon(
                      Icons.remove_red_eye,
                      color: value
                          ? AppTheme.secondaryColor
                          : AppTheme.primaryColor,
                    )),
                suffixIconColor: AppTheme.secondaryColor,
              ),
              obscureText: value,
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ValueListenableBuilder(
          valueListenable: isObsecureCPassword,
          builder: (BuildContext context, bool value, child) {
            return TextField(
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIcon: GestureDetector(
                      onTap: changeObsecureCP,
                      child: Icon(
                        Icons.remove_red_eye,
                        color: value
                            ? AppTheme.secondaryColor
                            : AppTheme.primaryColor,
                      )),
                  suffixIconColor: AppTheme.secondaryColor),
              obscureText: value,
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {},
            child: const Text('Sign Up',
                style: TextStyle(color: AppTheme.bgColor))),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(color: AppTheme.secondaryColor),
            ),
            TextButton(
                onPressed: () {
                  tabController.animateTo(1);
                },
                child: const Text('Log in'))
          ],
        )
      ],
    ));
  }
}
