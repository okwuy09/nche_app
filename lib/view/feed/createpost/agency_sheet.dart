import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/services/controller/agency_controller.dart';

import 'package:nche/widget/popover.dart';
import 'package:provider/provider.dart';
import '../../../model/agency.dart';
import '../../../widget/colors.dart';
import '../../../widget/style.dart';

class SearchAgency extends StatefulWidget {
  const SearchAgency({super.key});

  @override
  State<SearchAgency> createState() => _SearchAgencyState();
}

final TextEditingController _search = TextEditingController();

class _SearchAgencyState extends State<SearchAgency> {
  @override
  void dispose() {
    _search.clear();
    super.dispose();
  }

  List<Agency> agency = <Agency>[
    Agency(
      id: '0',
      agencyName: 'Police Command',
      agencyAddress: 'Agbani police',
      agencyLogo: 'assets/police.png',
    ),
    Agency(
      id: '1',
      agencyName: 'Enugu Frsc',
      agencyAddress: 'New heaven Frsc',
      agencyLogo: 'assets/frsc.png',
    ),
    Agency(
      id: '2',
      agencyName: 'Enugu fireservice',
      agencyAddress: 'New heaven fireservice',
      agencyLogo: 'assets/fireservice.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var agencyState = Provider.of<AgencyController>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Popover(
        mainAxisSize: MainAxisSize.min,
        child: Column(children: [
          Row(
            children: [
              Text(
                'Agency',
                style: style.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: AppColor.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(
            color: AppColor.lightGrey,
          ),
          SizedBox(
            height: 50,
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
          Divider(
            color: AppColor.lightGrey,
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) {
              if (_search.text == '') {
                return ListView.builder(
                    itemCount: agency.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return agencyWidget(agency, index, agencyState);
                    });
              } else {
                var searchAgency = agency
                    .where((e) => e.agencyAddress
                        .toLowerCase()
                        .contains(_search.text.toLowerCase()))
                    .toList();
                return ListView.builder(
                    itemCount: searchAgency.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return agencyWidget(searchAgency, index, agencyState);
                    });
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }

  /// Extracted widget
  Column agencyWidget(
      List<Agency> agency, int index, AgencyController agencyState) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            agencyState.getAgency.contains(agency[index].agencyAddress)
                ? setState(() {
                    agencyState.removeAgencyTag(agency[index].agencyAddress);
                  })
                : setState(() {
                    agencyState.addAgencyTag(agency[index].agencyAddress);
                  });
          },
          child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 2),
            child: Row(
              children: [
                Image.asset(
                  agency[index].agencyLogo,
                  height: 35,
                  width: 35,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 1.38,
                      child: Text(
                        agency[index].agencyName,
                        style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width / 1.38,
                      child: Text(
                        agency[index].agencyAddress,
                        style: style.copyWith(
                          fontSize: 12,
                          color: AppColor.lightBlack.withOpacity(0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor:
                          AppColor.lightBlack.withOpacity(0.2),
                    ),
                    child: Checkbox(
                      shape: const CircleBorder(),
                      value: agencyState.getAgency
                          .contains(agency[index].agencyAddress),
                      checkColor: AppColor.white,
                      activeColor: AppColor.primaryColor,
                      onChanged: (value) {
                        agencyState.getAgency
                                .contains(agency[index].agencyAddress)
                            ? setState(() {
                                agencyState.removeAgencyTag(
                                    agency[index].agencyAddress);
                              })
                            : setState(() {
                                agencyState
                                    .addAgencyTag(agency[index].agencyAddress);
                              });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 5,
          color: AppColor.lightGrey,
        )
      ],
    );
  }
}
