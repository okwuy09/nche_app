import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/widget/style.dart';
import '../../widget/colors.dart';
import '../sos/add_contact.dart';

class Finder extends StatefulWidget {
  const Finder({Key? key}) : super(key: key);
  @override
  State<Finder> createState() => _FinderState();
}

final TextEditingController _search = TextEditingController();

class _FinderState extends State<Finder> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      //animationDuration: const Duration(seconds: 5000),
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: AppColor.lightGrey,
          shadowColor: AppColor.lightGrey,
          backgroundColor: AppColor.lightGrey,
          elevation: 0.5,
          title: Row(
            children: [
              Text(
                'Finder',
                style: style.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
              Expanded(child: Container()),
              Text(
                'Find Me',
                style: style.copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.only(
                  top: 15, bottom: 10, right: 15, left: 15),
              decoration: BoxDecoration(
                color: AppColor.grey,
                border: Border.all(
                  color: AppColor.grey,
                  width: 6,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: style.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColor.black,
                ),
                unselectedLabelStyle: style.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColor.lightBlack,
                ),
                indicator: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelColor: AppColor.black,
                unselectedLabelColor: AppColor.darkgrey,
                tabs: const [
                  Tab(
                    text: 'Emergency contact',
                  ),
                  Tab(
                    text: 'Find friend',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  /// Emergency contact
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Add Emergency Contact',
                              style: style.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.lightBlack,
                              ),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () => showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (_) => const AddContact(),
                              ),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    AppColor.primaryColorLight.withOpacity(0.5),
                                child: Icon(
                                  Icons.add,
                                  color: AppColor.primaryColor,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                              //height: 50,
                              width: size.width,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 21,
                                    backgroundColor: AppColor.grey,
                                    child: Image.asset(
                                      'assets/user2.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nweke Michael',
                                        style: style.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '+2348137894628',
                                        style: style.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: AppColor.darkerGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      CupertinoIcons.xmark_circle,
                                      color: AppColor.red,
                                      //size: 28,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  /// Find friends Screen
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                        /// search field
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 45,
                          child: TextField(
                            controller: _search,
                            readOnly: true,
                            cursorColor: AppColor.textGrey,
                            style: style.copyWith(
                              fontSize: 14,
                              color: AppColor.darkerGrey.withOpacity(0.9),
                            ),
                            decoration: InputDecoration(
                              hintText: "Search for a person",
                              hintStyle: style.copyWith(
                                fontSize: 14,
                                color: AppColor.lightBlack.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                              ),
                              prefixIcon: Icon(
                                CupertinoIcons.search,
                                color: AppColor.lightBlack.withOpacity(0.6),
                                size: 20,
                              ),
                              filled: true,
                              fillColor: AppColor.grey.withOpacity(0.5),
                              contentPadding: const EdgeInsets.all(0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColor.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            onChanged: (value) => setState(() {}),
                          ),
                        ),
                        Container(
                          height: 450,
                          width: size.width,
                          color: AppColor.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
