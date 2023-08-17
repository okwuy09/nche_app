import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/feed/widget/feedcard.dart';
import 'package:nche/view/searchscreen/map_screen.dart';
import 'package:nche/view/searchscreen/widget/agency_hotline.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'agency_news.dart';

class AgencyDetail extends StatefulWidget {
  const AgencyDetail({super.key});

  @override
  State<AgencyDetail> createState() => _AgencyDetailState();
}

class _AgencyDetailState extends State<AgencyDetail> {
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
              Image.asset(
                'assets/police.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Area Command HQ',
                    style: style.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Icon(
                    CupertinoIcons.checkmark_seal_fill,
                    color: AppColor.primaryColor,
                    size: 18,
                  ),
                ],
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

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => const AgencyHotline(),
                  ),
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.only(
                      left: 15,
                      bottom: 15,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.phone_fill,
                            size: 18,
                            color: AppColor.primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Hotlines',
                            style: style.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const MapScreen(),
                    ),
                  ),
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.only(
                      right: 15,
                      bottom: 15,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.location_solid,
                            color: AppColor.primaryColor,
                            size: 19,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Map Location',
                            style: style.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
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
                      builder: (_) => const AgencyNews(
                        index: 0,
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

          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
