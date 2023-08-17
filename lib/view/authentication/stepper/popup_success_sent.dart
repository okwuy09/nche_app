import 'package:flutter/material.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/popover.dart';
import 'package:nche/widget/style.dart';

class PopUpSentSuccessfull extends StatelessWidget {
  const PopUpSentSuccessfull({
    Key? key,
    required this.secondOnTap,
    required this.title,
    required this.firstbuttonText,
    required this.secondbuttonText,
    required this.onTap,
  }) : super(key: key);
  final Function()? secondOnTap;
  final Function()? onTap;
  final String title;
  final String firstbuttonText;
  final String secondbuttonText;
  @override
  Widget build(BuildContext context) {
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/success.gif',
            height: 142,
            width: 176,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: style.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          MainButton(
            borderColor: Colors.transparent,
            backgroundColor: AppColor.primaryColor,
            onTap: onTap,
            child: Text(
              firstbuttonText,
              style: style.copyWith(
                fontSize: 12,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: secondOnTap,
            child: Text(
              secondbuttonText,
              style: style.copyWith(
                fontSize: 12,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
