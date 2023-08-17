import 'package:flutter/material.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class PanicShortcutWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String incident;
  final bool active;
  final void Function()? onTap;
  const PanicShortcutWidget({
    super.key,
    required this.active,
    required this.subTitle,
    required this.title,
    required this.incident,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: size.width / 1.24,
                child: Text(
                  title,
                  style: style.copyWith(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                    color: active
                        ? AppColor.black
                        : AppColor.lightBlack.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              SizedBox(
                width: size.width / 1.24,
                child: RichText(
                    text: TextSpan(
                        text: subTitle,
                        style: style.copyWith(
                          fontSize: 13.5,
                          color: active
                              ? AppColor.lightBlack.withOpacity(0.8)
                              : AppColor.lightBlack.withOpacity(0.4),
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                      TextSpan(
                        text: '  $incident',
                        style: style.copyWith(
                          fontSize: 12.5,
                          color: active
                              ? AppColor.primaryColorDark
                              : AppColor.primaryColorDark.withOpacity(0.2),
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ])),
              ),
            ],
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                'assets/edit.png',
                width: 25,
                height: 25,
                color: active
                    ? AppColor.primaryColor
                    : AppColor.primaryColor.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
