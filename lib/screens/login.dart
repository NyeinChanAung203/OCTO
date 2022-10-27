import 'package:flutter/material.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/shared/theme.dart';

class Login extends StatelessWidget {
  Login({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  final ValueNotifier<bool> isObsecure = ValueNotifier(true);

  void changeObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  @override
  Widget build(BuildContext context) {
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
          valueListenable: isObsecure,
          builder: (BuildContext context, bool value, child) {
            return TextField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: GestureDetector(
                      onTap: changeObsecure,
                      child: Icon(
                        Icons.remove_red_eye,
                        color: value
                            ? AppTheme.secondaryColor
                            : AppTheme.primaryColor,
                      )),
                  suffixIconColor: Colors.grey),
              obscureText: value,
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot password?',
            textAlign: TextAlign.end,
            style: TextStyle(color: AppTheme.secondaryColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.home);
            },
            child: const Text('Log In', style: TextStyle(color: Colors.white))),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            TextButton(
                onPressed: () {
                  tabController.animateTo(0);
                },
                child: const Text('Create here'))
          ],
        )
      ],
    ));
  }
}
