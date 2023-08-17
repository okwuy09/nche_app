import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/view/feed/widget/report_card.dart';
import 'package:nche/view/searchscreen/search.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/view/feed/widget/feedcard.dart';
import 'package:nche/widget/style.dart';
import 'action_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;
  String location = '9b Nza street, Independent';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.white,
          surfaceTintColor: AppColor.white,
          shadowColor: AppColor.white,
          toolbarHeight: 70,
          elevation: 0.5,
          actions: [
            const SizedBox(
              width: 15,
            ),

            CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(avatar('Avatar10')),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mockingjay90',
                  style: style.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    location.length > 20
                        ? '${location.substring(0, 20)}...'
                        : location,
                    style: style.copyWith(
                      fontSize: 12,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => const SearchScreen(),
                ),
              ),
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                    child: Icon(
                  CupertinoIcons.search,
                  color: AppColor.lightBlack,
                  size: 28,
                )

                    // Image.asset(
                    //   'assets/search.png',
                    //   width: 23,
                    //   height: 23,
                    //   color: AppColor.lightBlack,
                    // ),
                    ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            /// handburger menu
            GestureDetector(
              onTap: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (_) => ActionSheet(ctx: context),
              ),
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/menu.png',
                        height: 26,
                        width: 26,
                      ),
                      Positioned(
                        right: 3,
                        top: 3,
                        child: CircleAvatar(
                          radius: 3.5,
                          backgroundColor: AppColor.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
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
