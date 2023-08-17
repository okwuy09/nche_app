import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class NotificationWidget extends StatelessWidget {
  final int index;
  const NotificationWidget({super.key, required this.index});

  final bool isRead = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: isRead ? AppColor.lightBlue : AppColor.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            Image.asset(
              avatar('Avatar2'),
              height: 43,
              width: 43,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: index == 1 ? 'Area Command Enugu ' : 'Benjiro896 ',
                      style: style.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      children: [
                        index == 1
                            ? WidgetSpan(
                                child: Icon(
                                  CupertinoIcons.checkmark_seal_fill,
                                  color: AppColor.primaryColor,
                                  size: 15,
                                ),
                              )
                            : const WidgetSpan(child: Text('')),
                        TextSpan(
                          text: ' Complete verification to set up your account',
                          style: style.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.lightBlack.withOpacity(0.9),
                          ),
                        ),
                        TextSpan(
                          text: '  post',
                          style: style.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '12 mins ago',
                    style: style.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColor.lightBlack.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            isRead
                ? CircleAvatar(
                    radius: 3.5,
                    backgroundColor: AppColor.primaryColor,
                  )
                : Container(),
          ]),
        ),
        Divider(
          height: 0,
          color: AppColor.lightBlack.withOpacity(0.15),
        )
      ],
    );
  }
}
