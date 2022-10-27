import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
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
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: AppTheme.iconColor,
          ),
          splashRadius: 20,
        ),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: AppTheme.bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                          fontSize: 14.5,
                          color: AppTheme.secondaryColor,
                          textBaseline: TextBaseline.ideographic),
                      border: InputBorder.none,
                      suffixIconColor: AppTheme.iconColor,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (_controller.text.trim().isNotEmpty) {
                            _controller.text = '';
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Icon(Icons.close_rounded),
                      )),
                ),
              )),
        ),
      ]),
    );
  }
}
