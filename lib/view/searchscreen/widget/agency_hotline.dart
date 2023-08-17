import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/popover.dart';
import 'package:nche/widget/style.dart';

class AgencyHotline extends StatelessWidget {
  const AgencyHotline({super.key});

  @override
  Widget build(BuildContext context) {
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Agencies Hotlines',
                style: style.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Sora',
                ),
                textAlign: TextAlign.center,
              ),
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
                  )),
                ),
              ),
            ],
          ),
          Divider(
            color: AppColor.lightGrey,
          ),
          const SizedBox(height: 15),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Row(children: [
                    Icon(
                      CupertinoIcons.phone_fill,
                      size: 20,
                      color: AppColor.black,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '09006510000',
                      style: style.copyWith(
                        color: AppColor.lightBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColor.lightBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/copy.png',
                            height: 24,
                            width: 24,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    )
                  ]),
                  Divider(
                    color: AppColor.lightGrey,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
