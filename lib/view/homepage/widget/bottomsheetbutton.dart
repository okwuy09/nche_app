import 'package:flutter/material.dart';
import 'package:nche/widget/style.dart';

class ButtomSheetButton extends StatelessWidget {
  final String imageUrl;
  final String label;
  final Color? indicatorColor;
  const ButtomSheetButton({
    Key? key,
    required this.imageUrl,
    required this.indicatorColor,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        Image.asset(
          imageUrl,
          height: 20,
          width: 20.5,
          color: indicatorColor,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: style.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: indicatorColor,
          ),
        ),
      ],
    );
  }
}
