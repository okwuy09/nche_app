import 'package:flutter/material.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import '../feed/widget/feedcard.dart';

class AgencyNews extends StatefulWidget {
  final int index;
  const AgencyNews({super.key, required this.index});

  @override
  State<AgencyNews> createState() => _AgencyNewsState();
}

class _AgencyNewsState extends State<AgencyNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        toolbarHeight: 60,
        shadowColor: AppColor.white,
        title: Row(
          children: [
            const BackNav(),
            Expanded(child: Container()),
            Text(
              'Area Command HQ',
              style: style.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
      body: Container(
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
    );
  }
}
