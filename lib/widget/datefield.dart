import 'package:flutter/material.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class DateField extends StatelessWidget {
  final String pickedDate;
  final Function()? onPressed;
  const DateField({Key? key, required this.pickedDate, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: screenSize.width,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.circular(62),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            pickedDate,
            style: style.copyWith(
              fontSize: 14,
              color: AppColor.textGrey,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(child: Container()),
          GestureDetector(
              onTap: onPressed,
              child: Icon(
                Icons.arrow_drop_down,
                size: 26,
                color: AppColor.lightBlack.withOpacity(0.5),
              ))
        ],
      ),
    );
  }
}
