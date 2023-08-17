import 'package:flutter/material.dart';
import 'package:nche/view/homepage/widget/notification_widget.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: _scaffoldKey,
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
                  'Notifications',
                  style: style.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColor.black,
                  ),
                ),
                Expanded(child: Container()),
                TextButton(
                  onPressed: isEmpty ? null : () {},
                  child: Text(
                    'Mark as read',
                    style: style.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: isEmpty ? AppColor.grey : AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: isEmpty
              ? SizedBox(
                  width: size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/empty_notify.png',
                          width: 160,
                          height: 160,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'You don’t have any\nnotification yet.',
                          style: style.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColor.lightBlack.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                )
              : Column(
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
                        unselectedLabelColor:
                            AppColor.lightBlack.withOpacity(0.9),
                        tabs: const [
                          Tab(
                            text: 'All',
                          ),
                          Tab(
                            text: 'Agencies',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          /// All Notification
                          MediaQuery.removePadding(
                            context: context,
                            removeLeft: true,
                            removeTop: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return NotificationWidget(index: index);
                              },
                            ),
                          ),

                          /// Agency Notification
                          MediaQuery.removePadding(
                            context: context,
                            removeLeft: true,
                            removeTop: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return NotificationWidget(index: index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
    );
  }
}
