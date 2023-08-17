import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/feed/reward/reward_post_widget.dart';
import 'package:nche/view/feed/reward/user_reward_hub.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class RewardHub extends StatefulWidget {
  const RewardHub({super.key});

  @override
  State<RewardHub> createState() => _RewardHubState();
}

class _RewardHubState extends State<RewardHub> {
  @override
  Widget build(BuildContext context) {
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
                'Rewards Hub',
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColor.black,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const UserRewardHub(),
                  ),
                ),
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/user2.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              )
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
                    text: 'In progress',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  /// News
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeLeft: true,
                      removeTop: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return RewardPostWidget(
                            context: context,
                            index: index,
                            iscompleted: false,
                            //post: [],
                          );
                        },
                      ),
                    ),
                  ),

                  /// Reports
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeLeft: true,
                      removeTop: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return RewardPostWidget(
                            context: context,
                            index: index,
                            iscompleted: true,
                            //post: [],
                          );
                        },
                      ),
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
