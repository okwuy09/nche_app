import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/popover.dart';
import '../../../widget/colors.dart';
import '../../../widget/style.dart';

class ConfirmRewardSheet extends StatefulWidget {
  const ConfirmRewardSheet({super.key});

  @override
  State<ConfirmRewardSheet> createState() => _ConfirmRewardSheetState();
}

class _ConfirmRewardSheetState extends State<ConfirmRewardSheet> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Popover(
        mainAxisSize: MainAxisSize.min,
        child: Column(children: [
          Row(
            children: [
              Expanded(child: Container()),
              GestureDetector(
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
                      Icons.close,
                      color: AppColor.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            color: AppColor.lightBlack.withOpacity(.2),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width / 2.2,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.grey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(children: [
                Image.asset(
                  avatar('Avatar6'),
                  height: 42,
                  width: 42,
                ),
                Expanded(child: Container()),
                const Icon(CupertinoIcons.arrow_right),
                Expanded(child: Container()),
                Image.asset(
                  avatar('Avatar10'),
                  height: 42,
                  width: 42,
                ),
              ]),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your evidences and claims would\nbe securely submitted to the\nresponsible authority.',
            style: style.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColor.black,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            height: 145,
            //margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: size.width,
            decoration: BoxDecoration(
              color: AppColor.lightOrange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: AppColor.yellow,
                  size: 26,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: RichText(
                      text: TextSpan(
                          text:
                              'If the authorities finds your evidence helpful in solving the case, it would be made public for the community to vote on. ',
                          style: style.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.8,
                          ),
                          children: [
                        TextSpan(
                          text:
                              ' (The voting is to make the process transparent and fair and also for the community to decide who gets the reward based on the evidences available.)',
                          style: style.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 13.8,
                          ),
                        ),
                      ])),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            color: AppColor.lightBlack.withOpacity(.2),
          ),
          //
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              AppColor.lightBlack.withOpacity(0.2),
                        ),
                        child: Checkbox(
                          shape: const CircleBorder(),
                          value: selected,
                          checkColor: AppColor.white,
                          activeColor: AppColor.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              selected = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'I certify that my evidences are not fabricated',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                MainButton(
                  borderColor: Colors.transparent,
                  backgroundColor: AppColor.primaryColor,
                  onTap: () => {
                    Navigator.pop(context),
                    successTopSnackBar(
                      context: context,
                      message: 'Evidences submitted successfully',
                    ),
                  },
                  child: Text(
                    'Submit',
                    style: style.copyWith(
                      fontSize: 14,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
