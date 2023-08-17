import 'package:flutter/material.dart';
import 'package:nche/widget/style.dart';

class TransDetailWidget extends StatelessWidget {
  final String title;
  final String text;
  const TransDetailWidget({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: style.copyWith(fontSize: 14),
        ),
        Expanded(child: Container()),
        Text(
          text,
          style: style.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
