import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/popover.dart';
import '../../../widget/colors.dart';
import '../../../widget/style.dart';

class RewardMediaAttachment extends StatefulWidget {
  const RewardMediaAttachment({super.key});

  @override
  State<RewardMediaAttachment> createState() => _RewardMediaAttachmentState();
}

class _RewardMediaAttachmentState extends State<RewardMediaAttachment> {
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

          Container(
            height: 45,
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
                  child: Text(
                    'You can only vote for one person’s evidence',
                    style: style.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),

          /// User text description of the incident
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              //color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColor.white,
                      backgroundImage: AssetImage(avatar('Avatar2')),
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
                  height: 10,
                ),
                Text(
                  'I clearly saw the two guys hop into the car in question and zoomed off through the opposite junction. one of them was wearing a black tee.',
                  style: style.copyWith(
                    fontSize: 14.5,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColor.lightBlack.withOpacity(.2),
          ),
          const SizedBox(
            height: 10,
          ),

          /// image evidence of the incident
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        avatar('Avatar5'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: AppColor.lightBlack.withOpacity(.2),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            width: size.width,
            color: AppColor.grey,
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: AppColor.lightBlack.withOpacity(.2),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: MainButton(
              borderColor: Colors.transparent,
              backgroundColor: AppColor.primaryColor,
              onTap: () => {
                Navigator.pop(context),
                successTopSnackBar(
                  context: context,
                  message:
                      'Voting successful. You’ve received 0.005 tokens in your wallet',
                ),
              },
              child: Text(
                'Vote',
                style: style.copyWith(
                  fontSize: 14,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
