import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/feed/report_post.dart';
import 'package:nche/view/feed/widget/share_post.dart';
import 'package:nche/view/homepage/widget/action_button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/popover.dart';

class ReportMenu extends StatelessWidget {
  const ReportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(children: [
        ActionButton(
          assetImageURL: 'assets/link.png',
          title: 'Copy Report link',
          iconColor: AppColor.black,
          textColor: AppColor.black,
          onTap: () {},
          child: Container(),
        ),
        Divider(
          color: AppColor.grey.withOpacity(0.5),
        ),
        ActionButton(
          assetImageURL: 'assets/share.png',
          title: 'Share Report',
          iconColor: AppColor.black,
          textColor: AppColor.black,
          onTap: () => {
            Navigator.pop(context),
            sharePost(
              imageUrl: '',
              text: 'Am Just Testing the aaplication',
            ),
          },
          child: Container(),
        ),
        Divider(
          color: AppColor.grey.withOpacity(0.5),
        ),
        ActionButton(
          assetImageURL: 'assets/danger.png',
          title: 'Report Post',
          iconColor: AppColor.black,
          textColor: AppColor.black,
          onTap: () => Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (_) => const ReportPost(),
            ),
          ),
          child: Container(),
        ),
        Column(
          children: [
            Divider(
              color: AppColor.grey.withOpacity(0.5),
            ),
            ActionButton(
              assetImageURL: 'assets/edit.png',
              title: 'Edit Report',
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
              title: 'Delete',
              iconColor: AppColor.red,
              textColor: AppColor.red,
              onTap: () {},
              child: Container(),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        )
      ]),
    );
  }
}
