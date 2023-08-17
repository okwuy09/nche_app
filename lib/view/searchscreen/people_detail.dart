import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/view/feed/widget/feedcard.dart';
import 'package:nche/view/feed/widget/report_card.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

import 'widget/news_report_widget.dart';

class PeopleDetail extends StatefulWidget {
  const PeopleDetail({super.key});

  @override
  State<PeopleDetail> createState() => _PeopleDetailState();
}

class _PeopleDetailState extends State<PeopleDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        automaticallyImplyLeading: false,
        elevation: 0.5,
        toolbarHeight: 60,
        shadowColor: AppColor.white,
        title: const BackNav(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          /// user Avatar and infor
          Container(
            height: 190,
            width: size.width,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(avatar('Avatar12')),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Benjiro896',
                style: style.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                '20 Reports • 200 News',
                style: style.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkgrey,
                ),
              ),
            ]),
          ),

          /// Recent News
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'RECENT NEWS',
                  style: style.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.lightBlack,
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const NewsAndReportWidget(
                        index: 0,
                        title: 'Benjiro896',
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: [
                        Text(
                          'SEE ALL',
                          style: style.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.arrow_right,
                          color: AppColor.primaryColor,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 370,
            padding: const EdgeInsets.only(left: 10),
            child: MediaQuery.removePadding(
              context: context,
              removeLeft: true,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return index == 1
                      ? Container()
                      : FeedCard(
                          context: context,
                          index: index,
                          //post: [],
                        );
                },
              ),
            ),
          ),

          /// Recent Report
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (_) => const NewsAndReportWidget(
                    index: 1,
                    title: 'Benjiro896',
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(3),
                child: Row(
                  children: [
                    Text(
                      'RECENT REPORTS',
                      style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.lightBlack,
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Text(
                          'SEE ALL',
                          style: style.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.arrow_right,
                          color: AppColor.primaryColor,
                          size: 16,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 375,
            padding: const EdgeInsets.only(left: 10),
            child: MediaQuery.removePadding(
              context: context,
              removeLeft: true,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ReportCard();
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
