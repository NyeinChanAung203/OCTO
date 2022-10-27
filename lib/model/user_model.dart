import 'package:test1/model/message_model.dart';

class UserModel {
  final String name, imageUrl;
  final List<Message> messages;
  final String id;

  UserModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.messages,
  });

  void addMessage(Message message) {
    messages.add(message);
  }
}
