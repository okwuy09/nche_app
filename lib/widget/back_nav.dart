import 'package:flutter/cupertino.dart';
import 'package:nche/widget/colors.dart';

class BackNav extends StatelessWidget {
  const BackNav({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          color: AppColor.lightGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.arrow_left,
            color: AppColor.black,
          ),
        ),
      ),
    );
  }
}
