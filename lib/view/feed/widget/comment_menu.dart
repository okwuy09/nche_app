import 'package:flutter/material.dart';
import 'package:nche/view/homepage/widget/action_button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/popover.dart';

class CommentMenuSheet extends StatelessWidget {
  const CommentMenuSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(children: [
        ActionButton(
          assetImageURL: 'assets/pin.png',
          title: 'Pin comment',
          iconColor: AppColor.black,
          textColor: AppColor.black,
          onTap: () {},
          child: Container(),
        ),
        Divider(
          color: AppColor.grey.withOpacity(0.5),
        ),
        ActionButton(
          assetImageURL: 'assets/report.png',
          title: 'Report comment',
          iconColor: AppColor.black,
          textColor: AppColor.black,
          onTap: () {},
          child: Container(),
        ),
        Divider(
          color: AppColor.grey.withOpacity(0.5),
        ),
        ActionButton(
          assetImageURL: 'assets/delete.png',
          title: 'Delete comment ',
          iconColor: AppColor.red,
          textColor: AppColor.red,
          onTap: () {},
          child: Container(),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
