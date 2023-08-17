import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/view/feed/post_comment.dart';
import 'package:nche/view/feed/post_detail.dart';
import 'package:nche/view/feed/reward/claim_reward.dart';
import 'package:nche/view/feed/widget/grid_image.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'news_menu_sheet.dart';

class FeedCard extends StatelessWidget {
  final int index;
  //final List post;
  final bool isNewsDetail;
  final BuildContext context;
  const FeedCard({
    Key? key,
    required this.context,
    required this.index,
    this.isNewsDetail = false,
    //required this.post,
  }) : super(key: key);
  final String text =
      'Please we are stranded at tall mellan bridge. We just had an accident. Please we are stranded at tall mellan bridge. We just had an accident. We just had an accident. Please we are stranded at tall mellan bridge, We just had an accident.';
  final String location = '042, Coal city state. Obodo';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.91,
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              index == 1
                  ? Image.asset(
                      'assets/police.png',
                      height: 42,
                      width: 42,
                    )
                  : CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColor.white,
                      backgroundImage: AssetImage(avatar('Avatar${index + 1}')),
                    ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Area Command Enugu',
                              style: style.copyWith(
                                fontSize: 15.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              CupertinoIcons.checkmark_seal_fill,
                              color: AppColor.primaryColor,
                              size: 15,
                            ),
                          ],
                        )
                      : RichText(
                          text: TextSpan(
                            text: 'Benjiro896',
                            // post[index].isAnanymous
                            //     ? 'Anonymous'
                            //     : post[index].sender.userName!,
                            style: style.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.5,
                            ),
                          ),
                        ),
                  const SizedBox(height: 2),
                  Text(
                    '3 mins ago',
                    //timeEn(post[index].time.toIso8601String(), numberDate: true),
                    style: style.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColor.lightBlack.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              isNewsDetail
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () => showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => const NewsMenu(),
                        ),
                        child: Icon(
                          Icons.more_horiz,
                          color: AppColor.lightBlack,
                          size: 28,
                        ),
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: isNewsDetail
                  ? text
                  : text.length > 150
                      ? '${text.substring(0, 150)}...'
                      : text,
              style: style.copyWith(
                color: AppColor.black,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              children: [
                isNewsDetail
                    ? const TextSpan()
                    : TextSpan(
                        text: ' See More',
                        style: style.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColor.black,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => const NewsDetail(),
                                ),
                              ),
                      ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          index == 2
              ? Container()
              : InkWell(
                  onTap: () => {},
                  child: Container(
                    width: size.width,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child:
                        //  post[index].avarter!.length <= 1
                        //     ?
                        //     Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(4),
                        //     image: DecorationImage(
                        //       image: NetworkImage(post[index].avarter![0]),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // )
                        PhotoGrid(
                      imageUrls: const [
                        'https://www.northern-times.co.uk/_media/img/92HKPTP5V2GMDAJ2QMN6.jpg',
                        'https://scd.infomigrants.net/media/resize/my_image_medium/f90f6fb734c326a6e97e9485bfa689dc07fd091d.jpg',
                        'https://cdn.telanganatoday.com/wp-content/uploads/2023/04/Telangana-Father-son-die-in-road-accident-in-Nalgonda.jpg',
                        'https://media.premiumtimesng.com/wp-content/files/2023/04/Scene-of-the-fatal-road-accident-in-Cross-River-State.jpeg',
                      ],
                      onImageClicked: (i) {},
                      onExpandClicked: () {},
                    ),
                  ),
                ),

          /// Reword post
          index == 1
              ? Container(
                  height: 100,
                  width: size.width,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColor.lightRed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: AppColor.lightOrange,
                              child: Image.asset(
                                'assets/coin.png',
                                height: 24,
                                width: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '20,000,000',
                              style: style.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => const ClaimReward(),
                            ),
                          ),
                          child: Container(
                            height: 40,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: AppColor.golden,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                                child: Text(
                              'Claim Reward',
                              style: style.copyWith(
                                fontSize: 14,
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ),
                        ),
                      ]),
                )
              : Container(),
          const SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                onTap: () async {},
                child: Image.asset(
                  'assets/eye.png',
                  width: 20,
                  height: 20,
                  color: AppColor.lightBlack.withOpacity(0.8),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '23.2k',
                style: style.copyWith(
                  fontSize: 10,
                  color: AppColor.lightBlack,
                ),
              ),
              Flexible(flex: 2, child: Container()),
              // comment
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => const PostComment()),
                ),
                child: Image.asset(
                  'assets/message.png',
                  height: 20,
                  width: 20,
                  color: AppColor.lightBlack,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '156',
                style: style.copyWith(fontSize: 10),
              ),
              Flexible(child: Container()),
              // up like
              InkWell(
                onTap: () async {},
                child: Icon(
                  CupertinoIcons.hand_thumbsup,
                  color: AppColor.lightBlack,
                  size: 20,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '1.2k',
                style: style.copyWith(fontSize: 10),
              ),

              // down like
              Flexible(child: Container()),
              InkWell(
                onTap: () async {},
                child: Icon(
                  CupertinoIcons.hand_thumbsdown_fill,
                  color: AppColor.red,
                  size: 20,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '24.2k',
                style: style.copyWith(fontSize: 10),
              ),

              // share post
            ],
          )
        ],
      ),
    );
  }
}
