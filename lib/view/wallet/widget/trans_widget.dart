import 'package:flutter/material.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class TransactionWidget extends StatelessWidget {
  final Function()? onTap;
  final String assetImageUrl;
  final String title;
  const TransactionWidget(
      {super.key,
      this.onTap,
      required this.assetImageUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetImageUrl,
              width: 21,
              height: 21,
              color: AppColor.primaryColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: style.copyWith(
                color: AppColor.primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
