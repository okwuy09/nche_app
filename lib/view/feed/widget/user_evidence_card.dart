import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/view/feed/post_detail.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class RewardEvidenceCard extends StatelessWidget {
  final int index;
  const RewardEvidenceCard({super.key, required this.index});
  final String text =
      'Please we are stranded at tall mellan bridge. We just had an accident. Please we are stranded at tall mellan bridge. We just had an accident. We just had an accident. Please we are stranded at tall mellan bridge, We just had an accident.';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: AppColor.white,
              backgroundImage: AssetImage(
                avatar('Avatar${index + 1}'),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Benjiro896',
                    style: style.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Submitted on 23rd Jun, 2023 by 9:35 AM',
                  style: style.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColor.lightBlack.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),

        /// indication container to know if is verified or pending
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 3,
          ),
          decoration: BoxDecoration(
            color: index == 0 ? AppColor.lightOrange : AppColor.lightGreen,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            index == 0 ? 'PENDING' : 'VERIFIED',
            style: style.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: index == 0 ? AppColor.golden : AppColor.green,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        /// Tagged post, with reward
        Container(
          width: size.width,
          height: 140,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.darkgrey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    index == 0
                        ? 'assets/police.png'
                        : avatar('Avatar${index + 1}'),
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Area Command Enugu',
                                  style: style.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  CupertinoIcons.checkmark_seal_fill,
                                  color: AppColor.primaryColor,
                                  size: 15,
                                ),
                              ],
                            )
                          : RichText(
                              text: TextSpan(
                                text: 'Benjiro896',
                                style: style.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '3 mins ago',
                        //timeEn(post[index].time.toIso8601String(), numberDate: true),
                        style: style.copyWith(
                          fontWeight: FontWeight.normal,
                          color: AppColor.lightBlack.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text:
                      text.length > 150 ? '${text.substring(0, 150)}...' : text,
                  style: style.copyWith(
                    color: AppColor.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: ' See More',
                      style: style.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColor.black,
                        fontSize: 13,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const NewsDetail(),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'I clearly saw the two guys hop into the car in question and zoomed off through the opposite junction. one of them was wearing a black tee.',
          style: style.copyWith(
            fontSize: 14,
            color: AppColor.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          // onTap: () => showModalBottomSheet(
          //   backgroundColor: Colors.transparent,
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (_) => const RewardMediaAttachment(),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'See attached media',
                style: style.copyWith(
                  fontSize: 14,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                color: AppColor.black,
                size: 30,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
