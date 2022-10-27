class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  bool isShowDate;

  Message(
      {required this.text,
      required this.date,
      required this.isSentByMe,
      required this.isShowDate});
}
