import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/shared/image_url.dart';
import 'package:test1/shared/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Routes.signUpIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Image(image: AssetImage(AssetImageUrl.logo)),
      ),
    );
  }
}
