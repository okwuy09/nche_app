import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/services/controller/places_controller.dart';
import 'package:nche/widget/popover.dart';
import 'package:provider/provider.dart';
import '../../widget/colors.dart';
import '../../widget/style.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

final TextEditingController _search = TextEditingController();

class _SearchLocationState extends State<SearchLocation> {
  String _isSeclected = '';

  @override
  void dispose() {
    _search.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<PlacesController>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Popover(
        mainAxisSize: MainAxisSize.min,
        child: Column(children: [
          Row(
            children: [
              Text(
                'Location',
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
                hintText: "Search location...",
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
              onChanged: (value) => provider.placeAutoComplete(_search.text),
            ),
          ),
          Divider(
            color: AppColor.lightGrey,
          ),
          const SizedBox(height: 20),
          provider.placePrediction.isEmpty
              ? Container(
                  height: 160,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                      child: Text(
                    'Search Location',
                    style: style.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primaryColor.withOpacity(0.4),
                    ),
                    textAlign: TextAlign.center,
                  )),
                )
              : ListView.builder(
                  itemCount: provider.placePrediction.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () => _isSeclected =
                                provider.placePrediction[index].description!,
                          );
                          provider.setlocation(_isSeclected);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/location.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width / 1.34,
                                      child: Text(
                                        provider.placePrediction[index]
                                            .description!,
                                        style: style.copyWith(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width / 1.34,
                                      child: Text(
                                        provider
                                            .placePrediction[index]
                                            .structuredFormatting!
                                            .secondaryText!,
                                        style: style.copyWith(
                                          fontSize: 12,
                                          color: AppColor.lightBlack
                                              .withOpacity(0.8),
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
                                      value: provider.getLocation ==
                                          provider.placePrediction[index]
                                              .description,
                                      checkColor: AppColor.white,
                                      activeColor: AppColor.primaryColor,
                                      onChanged: (value) {
                                        setState(
                                          () => _isSeclected = provider
                                              .placePrediction[index]
                                              .description!,
                                        );
                                        provider.setlocation(_isSeclected);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Divider(
                        height: 5,
                        color: AppColor.lightGrey,
                      )
                    ],
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
