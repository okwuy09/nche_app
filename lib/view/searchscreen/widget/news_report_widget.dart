import 'package:flutter/material.dart';
import 'package:nche/view/feed/widget/feedcard.dart';
import 'package:nche/view/feed/widget/report_card.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class NewsAndReportWidget extends StatefulWidget {
  final int index;
  final String title;
  const NewsAndReportWidget(
      {super.key, required this.index, required this.title});

  @override
  State<NewsAndReportWidget> createState() => _NewsAndReportWidgetState();
}

class _NewsAndReportWidgetState extends State<NewsAndReportWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.index,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          surfaceTintColor: AppColor.white,
          automaticallyImplyLeading: false,
          elevation: 0.5,
          toolbarHeight: 60,
          shadowColor: AppColor.white,
          title: Row(
            children: [
              const BackNav(),
              Expanded(child: Container()),
              Text(
                widget.title,
                style: style.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(flex: 2, child: Container()),
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
                    text: 'News',
                  ),
                  Tab(
                    text: 'Reports',
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
                      top: 15,
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
                          return FeedCard(
                            context: context,
                            index: index,
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
                      top: 15,
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
                          return const ReportCard();
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
