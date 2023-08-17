import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

import '../../../constant.dart';
import 'media_attachment_sheet.dart';

class RewardVerifiedEvidence extends StatefulWidget {
  const RewardVerifiedEvidence({super.key});

  @override
  State<RewardVerifiedEvidence> createState() => _RewardVerifiedEvidenceState();
}

class _RewardVerifiedEvidenceState extends State<RewardVerifiedEvidence> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        automaticallyImplyLeading: false,
        shadowColor: AppColor.white,
        title: Row(children: [
          const BackNav(),
          const SizedBox(
            width: 30,
          ),
          Text(
            'Verified evidences',
            style: style.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColor.black,
            ),
          ),
          Expanded(child: Container()),
        ]),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Help decide who gets the reward',
                style: style.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.lightOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'These evidences have been verified by Uwani Police Dept as helpful and accurate. ',
                      style: style.copyWith(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Divider(
                      color: AppColor.lightBlack.withOpacity(0.2),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            'We urge you to examine the case and the evidences carefully then vote on the most accurate, you get',
                        style: style.copyWith(
                          fontSize: 14.5,
                          fontWeight: FontWeight.normal,
                          color: AppColor.black,
                        ),
                        children: [
                          TextSpan(
                            text: '  0.005 tokens',
                            style: style.copyWith(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '  for your help.',
                            style: style.copyWith(
                              fontSize: 14.2,
                              fontWeight: FontWeight.normal,
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              /// Timer for users to verify evidence
              Row(
                children: [
                  Icon(
                    CupertinoIcons.timer_fill,
                    color: AppColor.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Time remaining: ',
                    style: style.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    '48hrs 50mins 12secs',
                    style: style.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.lightBlack,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Evidences',
                style: style.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeLeft: true,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        width: size.width,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 23,
                                backgroundColor: AppColor.white,
                                backgroundImage:
                                    AssetImage(avatar('Avatar${index + 1}')),
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
                                      color:
                                          AppColor.lightBlack.withOpacity(0.8),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'I clearly saw the two guys hop into the car in question and zoomed off through the opposite junction. one of them was wearing a black tee.',
                            style: style.copyWith(
                              fontSize: 14.5,
                              color: AppColor.black,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          InkWell(
                            onTap: () => showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (_) => const RewardMediaAttachment(),
                            ),
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
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
