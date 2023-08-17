import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/feed/widget/user_evidence_card.dart';
import 'package:nche/view/feed/widget/user_reward_post.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class UserRewardHub extends StatefulWidget {
  const UserRewardHub({super.key});
  @override
  State<UserRewardHub> createState() => _UserRewardHubState();
}

class _UserRewardHubState extends State<UserRewardHub> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: AppColor.white,
          surfaceTintColor: AppColor.white,
          automaticallyImplyLeading: false,
          shadowColor: AppColor.white,
          title: Row(
            children: [
              const BackNav(),
              const SizedBox(
                width: 30,
              ),
              Text(
                'My Rewards Hub',
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColor.black,
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 1,
                ),
                labelStyle: style.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: AppColor.primaryColor,
                ),
                unselectedLabelStyle: style.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColor.lightBlack.withOpacity(0.9),
                ),
                labelColor: AppColor.primaryColor,
                unselectedLabelColor: AppColor.lightBlack.withOpacity(0.9),
                tabs: const [
                  Tab(
                    text: 'Received',
                  ),
                  Tab(
                    text: 'Given Out',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  /// Received
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        /// wallet
                        Container(
                          height: 160,
                          width: size.width,
                          color: AppColor.lightGrey,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: Container(
                            height: 100,
                            width: size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                              color: AppColor.green,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 9,
                                        backgroundColor: AppColor.green,
                                        child: Icon(
                                          CupertinoIcons.arrow_down_right,
                                          color: AppColor.white,
                                          size: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'TOTAL RECEIVED',
                                        style: style.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.lightBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '  20,678',
                                    style: style.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.black,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'SEE DETAILS',
                                        style: style.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: size.width,
                          color: AppColor.white,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'My Evidences',
                                    style: style.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    'Showing All',
                                    style: style.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Icon(
                                    Icons.filter_alt_rounded,
                                    color: AppColor.black,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 65,
                                width: size.width,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColor.lightOrange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'These are evidences you submitted to the authorities in response to other peoples posts',
                                    style: style.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              /// list of user claim evidence
                              MediaQuery.removePadding(
                                context: context,
                                removeLeft: true,
                                removeTop: true,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return RewardEvidenceCard(
                                      index: index,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  /// Given out
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        /// wallet
                        Container(
                          height: 160,
                          width: size.width,
                          color: AppColor.lightGrey,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: Container(
                            height: 100,
                            width: size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                              color: AppColor.darkRed,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 9,
                                        backgroundColor: AppColor.darkRed,
                                        child: Icon(
                                          CupertinoIcons.arrow_up_right,
                                          color: AppColor.white,
                                          size: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'TOTAL GIVEN OUT',
                                        style: style.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.lightBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '  20,678',
                                    style: style.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.black,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'SEE DETAILS',
                                        style: style.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: size.width,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'My Posts',
                                    style: style.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    'Showing All',
                                    style: style.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Icon(
                                    Icons.filter_alt_rounded,
                                    color: AppColor.black,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 40,
                                width: size.width,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColor.lightOrange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'These are posts you made with a reward attached.',
                                    style: style.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              /// list of user claim evidence
                              MediaQuery.removePadding(
                                context: context,
                                removeLeft: true,
                                removeTop: true,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return UserRewordPostCard(
                                      context: context,
                                      index: index,
                                      isNewsDetail: false,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
