import 'package:flutter/material.dart';
import 'package:test1/model/user_model.dart';
import 'package:test1/screens/acc_detail.dart';
import 'package:test1/screens/account_setting.dart';
import 'package:test1/screens/chat_detail.dart';
import 'package:test1/screens/favorite_setting.dart';
import 'package:test1/screens/home.dart';
import 'package:test1/screens/language_setting.dart';
import 'package:test1/screens/notification_setting.dart';
import 'package:test1/screens/privacy_setting.dart';
import 'package:test1/screens/search.dart';
import 'package:test1/screens/setting.dart';
import 'package:test1/screens/sign_up_in.dart';
import 'package:test1/screens/splash.dart';

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case "/home":
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case "/search":
        return MaterialPageRoute(builder: (context) => const SearchScreen());

      case "/signUpIn":
        return MaterialPageRoute(builder: (context) => const SignUpInScreen());

      case "/chatDetail":
        return MaterialPageRoute(
            builder: (context) =>
                ChatDetailScreen(userModel: settings.arguments as UserModel));

      case "/accDetail":
        return MaterialPageRoute(
            builder: (context) => AccDetailScreen(
                  userModel: settings.arguments as UserModel,
                ));

      case "/setting":
        return MaterialPageRoute(builder: (context) => const SettinScreen());

      case "/accountSetting":
        return MaterialPageRoute(
            builder: (context) => const AccountSettingScreen());

      case "/privacySetting":
        return MaterialPageRoute(
            builder: (context) => const PrivacySettingScreen());

      case "/notificationSetting":
        return MaterialPageRoute(
            builder: (context) => NotificationSettingScreen());

      case "/favoriteSetting":
        return MaterialPageRoute(
            builder: (context) => const FavoriteSettingScreen());

      case "/languageSetting":
        return MaterialPageRoute(
            builder: (context) => const LanguageSettingScreen());

      default:
        return MaterialPageRoute(builder: (context) => const SignUpInScreen());
    }
  }
}
