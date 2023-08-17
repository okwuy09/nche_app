import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

import 'widget/agencies_widget.dart';
import 'widget/people_widget.dart';
import 'widget/place_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

final TextEditingController _search = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: AppColor.white,
          surfaceTintColor: AppColor.white,
          automaticallyImplyLeading: false,
          shadowColor: AppColor.white,
          toolbarHeight: 65,
          title: Row(children: [
            /// search field
            Flexible(
              child: SizedBox(
                height: 46,
                child: TextField(
                  controller: _search,
                  cursorColor: AppColor.textGrey,
                  style: style.copyWith(
                    fontSize: 15,
                    color: AppColor.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: style.copyWith(
                      fontSize: 14,
                      color: AppColor.darkerGrey.withOpacity(0.5),
                    ),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: AppColor.darkerGrey.withOpacity(0.5),
                    ),
                    filled: true,
                    fillColor: AppColor.lightBlack.withOpacity(0.1),
                    contentPadding: const EdgeInsets.all(0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(
                        color: AppColor.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.close,
                  color: AppColor.black,
                  size: 25,
                ),
              ),
            )
          ]),
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
                physics: const NeverScrollableScrollPhysics(),
                indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 1,
                ),
                labelPadding: EdgeInsets.zero,
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
                    text: 'Places',
                  ),
                  Tab(
                    text: 'People',
                  ),
                  Tab(
                    text: 'Agencies',
                  ),
                  Tab(
                    text: 'Posts',
                  ),
                ],
              ),
            ),

            /// Pages
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  /// Places
                  Builder(
                    builder: (context) {
                      if (_search.text == '') {
                        return const PlaceWidget(length: 8);
                      } else {
                        return const PlaceWidget(length: 4);
                      }
                    },
                  ),

                  /// People
                  Builder(
                    builder: (context) {
                      if (_search.text == '') {
                        return const PeopleWidget(length: 8);
                      } else {
                        return const PeopleWidget(length: 4);
                      }
                    },
                  ),

                  /// Agencies
                  ///
                  Builder(
                    builder: (context) {
                      if (_search.text == '') {
                        return AgencyWidget(length: 3);
                      } else {
                        return AgencyWidget(length: 2);
                      }
                    },
                  ),

                  /// Post
                  Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      color: AppColor.primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
