import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/feed/createpost/report_incident.dart';
import 'package:nche/view/feed/createpost/write_post.dart';
import 'package:nche/view/feed/reward/reward_hub.dart';
import 'package:nche/view/homepage/notification.dart';
import 'package:nche/view/homepage/widget/filter_button.dart';
import 'package:nche/widget/popover.dart';
import '../../widget/colors.dart';
import '../../widget/style.dart';
import 'widget/action_button.dart';

class ActionSheet extends StatefulWidget {
  final BuildContext ctx;
  const ActionSheet({Key? key, required this.ctx}) : super(key: key);

  @override
  State<ActionSheet> createState() => _ActionSheetState();
}

class _ActionSheetState extends State<ActionSheet> {
  String _selectedFilter = 'Latest Posts';

  List<String> filter = [
    'Trending Posts',
    'Latest Posts',
    'Agency Posts',
    'Reward Posts',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Actions',
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
          const SizedBox(height: 20),

          /// Notification
          Container(
            height: 50,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ActionButton(
              assetImageURL: 'assets/notification.png',
              title: 'Notification',
              iconColor: AppColor.primaryColor,
              textColor: AppColor.black,
              onTap: () => Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (_) => const NotificationScreen(),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: AppColor.red,
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    size: 18,
                    color: AppColor.lightBlack,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          /// Reward
          Container(
            height: 50,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ActionButton(
              assetImageURL: 'assets/reward.png',
              title: 'Rewards',
              iconColor: AppColor.primaryColor,
              textColor: AppColor.black,
              onTap: () => Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (_) => const RewardHub(),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: AppColor.red,
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    size: 18,
                    color: AppColor.lightBlack,
                  )
                ],
              ),
            ),
          ),

          //
          const SizedBox(height: 25),
          Text(
            'TIMELINE FILTER',
            style: style.copyWith(
              fontSize: 12,
              color: AppColor.lightBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                mainAxisExtent: 58,
              ),
              itemCount: filter.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() {
                    _selectedFilter = filter[index];
                  }),
                  child: FilterButtonWidget(
                    showLatest: filter[index] == _selectedFilter,
                    title: filter[index],
                    onChanged: (value) => setState(() {
                      _selectedFilter = filter[index];
                    }),
                  ),
                );
              }),

          const SizedBox(
            height: 20,
          ),

          /// QUICK ACTIONS
          Text(
            'QUICK ACTIONS',
            style: style.copyWith(
              fontSize: 12,
              color: AppColor.lightBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(children: [
              ActionButton(
                assetImageURL: 'assets/post.png',
                title: 'Post',
                iconColor: AppColor.primaryColor,
                textColor: AppColor.black,
                onTap: () => Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const WritePost(),
                  ),
                ),
                child: Container(),
              ),
              Divider(
                color: AppColor.darkgrey.withOpacity(0.3),
              ),
              ActionButton(
                assetImageURL: 'assets/report.png',
                title: 'Report Incident',
                iconColor: AppColor.primaryColor,
                textColor: AppColor.black,
                onTap: () => Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const ReportIncident(),
                  ),
                ),
                child: Container(),
              ),
              Divider(
                color: AppColor.darkgrey.withOpacity(0.3),
              ),
              ActionButton(
                assetImageURL: 'assets/adduser.png',
                title: 'Add Emergency Contact',
                iconColor: AppColor.primaryColor,
                textColor: AppColor.black,
                onTap: () {},
                child: Container(),
              ),
              Divider(
                color: AppColor.darkgrey.withOpacity(0.3),
              ),
              ActionButton(
                assetImageURL: 'assets/record.png',
                title: 'Record Audio',
                iconColor: AppColor.primaryColor,
                textColor: AppColor.black,
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.lightBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'coming soon',
                    style: style.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.lightBlack.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ]),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
