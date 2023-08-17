import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/view/feed/widget/report_menu_sheet.dart';
import 'package:nche/view/feed/widget/reported_agencysheet.dart';
import 'package:nche/view/feed/widget/stacked_image.dart';
import 'package:nche/view/searchscreen/map_screen.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({super.key});
  final String location = '042, Coal city state, Obodo ife n’em city state';
  final String text =
      'Please we are stranded at tall mellan bridge. We just had an accident. Please we are stranded at tall mellan bridge. We just had an accident. We just had an accident. Please we are stranded at tall mellan bridge.';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.91,
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage(avatar('Avatar2')),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Sharpiro432',
                      // post[index].isAnanymous
                      //     ? 'Anonymous'
                      //     : post[index].sender.userName!,
                      style: style.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '3 mins ago',
                    //timeEn(post[index].time.toIso8601String(), numberDate: true),
                    style: style.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColor.lightBlack.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => const ReportMenu(),
                ),
                child: Icon(
                  Icons.more_horiz,
                  color: AppColor.lightBlack,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text.length > 200 ? '${text.substring(0, 200)}.' : text,
            style: style.copyWith(
              fontSize: 15,
              color: AppColor.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: AppColor.lightRed,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              'Hazard  🔥',
              //post[index].incidentType!,
              style: style.copyWith(
                fontSize: 10,
                color: AppColor.darkerGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Divider(
            color: AppColor.grey,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Image.asset(
                'assets/location.png',
                height: 25,
                width: 22,
                color: AppColor.lightBlack,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.length > 40
                        ? '${location.substring(0, 40)}...'
                        : location,
                    style: style.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColor.black,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const MapScreen(),
                      ),
                    ),
                    child: SizedBox(
                      height: 20,
                      child: Text(
                        'VIEW LOCATION ON MAP',
                        style: style.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColor.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Divider(
            color: AppColor.grey,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Image.asset(
                'assets/eye.png',
                width: 24,
                height: 22,
                color: AppColor.lightBlack.withOpacity(0.8),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '1.2k Views',
                style: style.copyWith(
                  fontSize: 13,
                  color: AppColor.lightBlack.withOpacity(0.8),
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => ReportedAgency(),
                ),
                child: StackedWidgets(
                  direction: TextDirection.rtl,
                  items: [
                    ...assetImages
                        .map((assetImage) => buildAssetImage(assetImage))
                        .toList(),
                  ],
                  size: 38,
                  xShift: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
