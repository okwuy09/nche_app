import 'package:flutter/material.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class FilterButtonWidget extends StatelessWidget {
  final bool showLatest;
  final String title;
  final void Function(bool?)? onChanged;
  const FilterButtonWidget({
    super.key,
    required this.showLatest,
    this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: showLatest ? AppColor.lightBlue : AppColor.grey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: showLatest ? AppColor.primaryColor : AppColor.grey,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: style.copyWith(
                color: showLatest
                    ? AppColor.black.withOpacity(0.7)
                    : AppColor.lightBlack.withOpacity(0.7),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          Checkbox(
            checkColor: AppColor.white,
            value: showLatest,
            shape: const CircleBorder(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
