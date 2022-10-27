import 'package:flutter/material.dart';
import 'package:test1/shared/theme.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile(
      {Key? key,
      required this.name,
      required this.isRequest,
      required this.imageUrl})
      : super(key: key);
  final String name, imageUrl;
  final bool isRequest;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        tileColor: AppTheme.bgColor,
        textColor: AppTheme.secondaryColor,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppTheme.titleColor),
        ),
        trailing: isRequest
            ? SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        splashRadius: 15,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cancel_presentation_sharp,
                          color: AppTheme.secondaryColor,
                        )),
                    IconButton(
                        splashRadius: 15,
                        onPressed: () {},
                        icon: const Icon(Icons.check_box,
                            color: AppTheme.primaryColor))
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
