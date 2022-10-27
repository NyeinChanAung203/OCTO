import 'package:flutter/material.dart';
import 'package:test1/screens/login.dart';
import 'package:test1/screens/sign_up.dart';
import 'package:test1/shared/image_url.dart';
import 'package:test1/shared/theme.dart';

class SignUpInScreen extends StatefulWidget {
  const SignUpInScreen({Key? key}) : super(key: key);

  @override
  State<SignUpInScreen> createState() => _SignUpInScreenState();
}

class _SignUpInScreenState extends State<SignUpInScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImageUrl.bgImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 5,
            shadowColor: AppTheme.primaryColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 430,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // tab
                    Container(
                      decoration: BoxDecoration(
                          color: AppTheme.bgColor,
                          border: Border.all(
                            color: AppTheme.secondaryColor,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: TabBar(
                        // physics: const NeverScrollableScrollPhysics(),
                        unselectedLabelColor: AppTheme.secondaryColor,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppTheme.primaryColor,
                        ),
                        tabs: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Text(
                              'Sign up',
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Text(
                              'Log in',
                            ),
                          ),
                        ],
                        controller: tabController,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Expanded(
                      child: TabBarView(controller: tabController, children: [
                        Signup(tabController: tabController),
                        Login(tabController: tabController)
                      ]),
                    ),
                  ],
                )),
          ),
        ));
  }
}
