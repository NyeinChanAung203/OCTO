import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:test1/model/message_model.dart';
import 'package:test1/model/user_model.dart';
import 'package:test1/provider/usermodel_provider.dart';
import 'package:test1/routes/routes.dart';

import 'package:test1/shared/theme.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent +
          (_scrollController.position.viewportDimension / 1.9));
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build chat deail');
    return Scaffold(
      backgroundColor: AppTheme.appBGColor,
      body: SafeArea(
          child: Column(
        children: [
          //appbar
          createAppBar(context),

          //body
          Expanded(
            child: Consumer<UserModelMessageProvider>(
              builder: (context, value, child) {
                var messages = value.getMessages(widget.userModel);
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Align(
                        alignment: messages[index].isSentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Provider.of<UserModelMessageProvider>(context,
                                        listen: false)
                                    .changeIsShowDate(index, widget.userModel);
                              },
                              child: Container(
                                width: messages[index].text.length > 30
                                    ? MediaQuery.of(context).size.width * 0.6
                                    : null,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: messages[index].isSentByMe
                                      ? AppTheme.primaryColor
                                      : AppTheme.bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  messages[index].text,
                                  style: TextStyle(
                                    color: messages[index].isSentByMe
                                        ? AppTheme.bgColor
                                        : AppTheme.titleColor,
                                  ),
                                ),
                              ),
                            ),
                            messages[index].isShowDate
                                ? Text(
                                    DateFormat.jm()
                                        .format(messages[index].date),
                                    style: const TextStyle(
                                      color: AppTheme.secondaryColor,
                                      fontSize: 12,
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                );
              },
            ),
          ),

          createBottomMessageBox(),
        ],
      )),
    );
  }

  Container createAppBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: AppTheme.bgColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.3),
                offset: const Offset(0, 2),
                spreadRadius: 0.3,
                blurRadius: 10),
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              icon: const Icon(
                Icons.chevron_left_rounded,
                color: AppTheme.iconColor,
              ),
              splashRadius: 20,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(widget.userModel.imageUrl),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.userModel.name,
              style: const TextStyle(
                color: AppTheme.titleColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppTheme.iconColor,
              ),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Routes.accDetail, arguments: widget.userModel);
              },
              icon: const Icon(
                Icons.info,
                color: AppTheme.iconColor,
              ),
              splashRadius: 20,
            ),
            const SizedBox(width: 10)
          ],
        )
      ]),
    );
  }

  Container createBottomMessageBox() {
    return Container(
      height: 66,
      decoration: const BoxDecoration(
          color: AppTheme.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.apps,
            color: AppTheme.primaryColor,
          ),
          splashRadius: 20,
        ),
        Expanded(
          child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: AppTheme.appBGColor,
                border:
                    Border.all(color: AppTheme.secondaryColor, width: 0.001),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                    hintText: 'Message',
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: AppTheme.secondaryColor,
                        textBaseline: TextBaseline.alphabetic),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      size: 22,
                    )),
              )),
        ),
        IconButton(
          onPressed: () {
            if (_controller.text.trim().isNotEmpty) {
              Provider.of<UserModelMessageProvider>(context, listen: false)
                  .addMessage(
                      widget.userModel,
                      Message(
                          isShowDate: false,
                          text: _controller.text,
                          date: DateTime.now(),
                          isSentByMe: true));

              _controller.text = '';
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
              _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent + 100,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
            }
          },
          icon: const Icon(
            Icons.send,
            color: AppTheme.primaryColor,
          ),
          splashRadius: 20,
        ),
      ]),
    );
  }
}
