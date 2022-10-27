import 'package:test1/model/message_model.dart';
import 'package:test1/model/user_model.dart';
import 'package:test1/shared/dummy_messages.dart';

List<UserModel> chatsDummy = [
  UserModel(
      id: '1',
      name: 'Ochitsuita Ame',
      imageUrl: 'assets/img/avatarOne.jpeg',
      messages: messages),
  UserModel(
      id: '2',
      name: 'Ko MoonSai',
      imageUrl: 'assets/img/avatarTwo.jpeg',
      messages: [
        Message(
            text: 'Hello Buddy',
            date: DateTime.now(),
            isSentByMe: true,
            isShowDate: false)
      ]),
  UserModel(
      id: '3',
      name: 'Swan Pyae Sone',
      imageUrl: 'assets/img/avatarThree.jpeg',
      messages: [
        Message(
            text: 'Hello Buddy',
            date: DateTime.now(),
            isSentByMe: true,
            isShowDate: false)
      ]),
  UserModel(
      id: '4',
      name: 'Zwe Marn Oo',
      imageUrl: 'assets/img/avatarFour.jpeg',
      messages: [
        Message(
            text: 'Hello Buddy',
            date: DateTime.now(),
            isSentByMe: true,
            isShowDate: false)
      ]),
  UserModel(
      id: '5',
      name: 'Kyaw Lin Naing',
      imageUrl: 'assets/img/avatarFive.jpeg',
      messages: [
        Message(
            text: 'Hello Buddy',
            date: DateTime.now(),
            isSentByMe: true,
            isShowDate: false)
      ]),
];
