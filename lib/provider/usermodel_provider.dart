import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:test1/model/message_model.dart';
import 'package:test1/model/user_model.dart';
import 'package:test1/shared/dummy_data.dart';

class UserModelMessageProvider extends ChangeNotifier {
  List<UserModel> chats = chatsDummy;

  List<Message> getMessages(UserModel user) {
    return user.messages;
  }

  void addMessage(UserModel userModel, Message message) {
    userModel.messages.add(message);
    notifyListeners();
  }

  void changeIsShowDate(int index, UserModel userModel) {
    userModel.messages[index].isShowDate =
        !userModel.messages[index].isShowDate;
    Timer(const Duration(seconds: 2), () {
      userModel.messages[index].isShowDate = false;
      notifyListeners();
    });
    notifyListeners();
  }
}
