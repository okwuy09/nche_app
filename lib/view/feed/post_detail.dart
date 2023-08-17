import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'widget/comment_menu.dart';
import 'widget/feedcard.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(
                  Icons.more_horiz_rounded,
                  color: AppColor.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width,
                child: FeedCard(
                  context: context,
                  isNewsDetail: true,
                  index: 0,
                  //post: [],
                ),
              ),
              Divider(
                color: AppColor.grey,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comments',
                        style: style.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Sora',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            color: AppColor.white,
                            child: Column(
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        avatar('Avatar${index + 1}'),
                                        height: 44,
                                        width: 44,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Benjiro896 ',
                                                  // post[index].isAnanymous
                                                  //     ? 'Anonymous'
                                                  //     : post[index].sender.userName!,
                                                  style: style.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Text(
                                                  '• 3 mins ago',
                                                  //timeEn(post[index].time.toIso8601String(), numberDate: true),
                                                  style: style.copyWith(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColor.lightBlack
                                                        .withOpacity(0.8),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                                GestureDetector(
                                                  onTap: () =>
                                                      showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (_) =>
                                                        const CommentMenuSheet(),
                                                  ),
                                                  child: Icon(
                                                    Icons.more_horiz,
                                                    color: AppColor.lightBlack,
                                                    size: 28,
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum.',
                                              style: style.copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),

                                            /// action button
                                            Row(
                                              children: [
                                                // comment
                                                InkWell(
                                                  onTap: () => {},
                                                  child: Image.asset(
                                                    'assets/message.png',
                                                    height: 20,
                                                    width: 20,
                                                    color: AppColor.lightBlack,
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '5',
                                                  style: style.copyWith(
                                                      fontSize: 10),
                                                ),
                                                Flexible(
                                                    flex: 2,
                                                    child: Container()),
                                                // up like
                                                InkWell(
                                                  onTap: () async {},
                                                  child: Icon(
                                                    CupertinoIcons
                                                        .hand_thumbsup_fill,
                                                    color:
                                                        AppColor.primaryColor,
                                                    size: 20,
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '1.2k',
                                                  style: style.copyWith(
                                                      fontSize: 10),
                                                ),

                                                // down like
                                                Flexible(child: Container()),
                                                InkWell(
                                                  onTap: () async {},
                                                  child: Icon(
                                                    CupertinoIcons
                                                        .hand_thumbsdown,
                                                    color: AppColor.lightBlack,
                                                    size: 20,
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '24.2k',
                                                  style: style.copyWith(
                                                      fontSize: 10),
                                                ),
                                                Flexible(
                                                    flex: 2,
                                                    child: Container()),
                                                // share post
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  color: AppColor.lightGrey,
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
      ),
    );
  }
}
