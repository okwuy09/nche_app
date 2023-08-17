import 'package:flutter/material.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/popover.dart';
import '../../../widget/colors.dart';
import '../../../widget/style.dart';

class AttachReward extends StatefulWidget {
  const AttachReward({super.key});

  @override
  State<AttachReward> createState() => _AttachRewardState();
}

class _AttachRewardState extends State<AttachReward> {
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    //var agencyState = Provider.of<AgencyController>(context);
    var size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Popover(
        mainAxisSize: MainAxisSize.min,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                'Attach Reward',
                style: style.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
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
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 110,
            width: size.width,
            color: AppColor.lightGrey,
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 100,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                color: AppColor.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: 90,
                width: size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'WALLET BALANCE',
                      style: style.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColor.lightBlack,
                      ),
                    ),
                    Text(
                      '20,678',
                      style: style.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          /// notice
          Container(
            height: 80,
            width: size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.lightOrange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Enter an amount you want to give out as reward.',
                  style: style.copyWith(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '  (Post would be sent tagged agencies for verification, before your post is published)',
                      style: style.copyWith(
                        fontSize: 14.2,
                        fontWeight: FontWeight.normal,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Amount',
            style: style.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 62,
            width: size.width,
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(children: [
              /// Amount subtraction
              Expanded(
                child: InkWell(
                  onTap: () => amount <= 0
                      ? null
                      : setState(() {
                          amount -= 100;
                        }),
                  child: Container(
                    height: 62,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: AppColor.lightBlack,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 5,
                child: Container(
                  height: 62,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      amount.toString(),
                      style: style.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ),
              ),

              /// Amount addition
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      amount += 100;
                    });
                  },
                  child: Container(
                    height: 62,
                    decoration: BoxDecoration(
                      color: AppColor.lightBlue,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 35,
          ),

          MainButton(
            borderColor: Colors.transparent,
            backgroundColor: AppColor.primaryColor,
            onTap: () => {},
            child: Text(
              'Publish Post',
              style: style.copyWith(
                fontSize: 14,
                color: AppColor.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }
}
