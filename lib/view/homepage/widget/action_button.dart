import 'package:flutter/material.dart';
import 'package:nche/widget/style.dart';

class ActionButton extends StatelessWidget {
  final Widget? child;
  final String title;
  final String assetImageURL;
  final Function()? onTap;
  final Color? iconColor;
  final Color? textColor;
  const ActionButton(
      {super.key,
      this.child,
      required this.title,
      required this.assetImageURL,
      this.onTap,
      required this.iconColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
          height: 43,
          width: size.width,
          child: Row(
            children: [
              Image.asset(
                assetImageURL,
                width: 24,
                height: 24,
                color: iconColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: style.copyWith(
                  fontSize: 14.5,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(child: Container()),
              child!,
            ],
          )),
    );
  }
}
