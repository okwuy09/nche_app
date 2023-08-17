import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/services/controller/places_controller.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'package:provider/provider.dart';

class StepThree extends StatefulWidget {
  final PageController controller;
  final int index;
  const StepThree({Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  State<StepThree> createState() => _StepThreeState();
}

final TextEditingController _search = TextEditingController();

class _StepThreeState extends State<StepThree> {
  String _isSeclected = '';
  @override
  void dispose() {
    _search.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var places = Provider.of<PlacesController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        Text(
          'Add your location',
          style: style.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Adding your location it will help us bring relevant news and reports happening around you.',
          style: style.copyWith(
            fontSize: 14,
            color: AppColor.darkerGrey,
          ),
        ),

        /// Create search field
        SizedBox(height: size.height / 25),

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
              hintText: "Search location",
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
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColor.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColor.white,
                ),
              ),
            ),
            onChanged: (value) => places.placeAutoComplete(_search.text),
          ),
        ),

        const SizedBox(height: 15),
        places.placePrediction.isEmpty
            ? Expanded(
                child: Container(
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
                ),
              )
            : Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: places.placePrediction.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(
                              () => _isSeclected =
                                  places.placePrediction[index].description!,
                            );
                            places.setlocation(_isSeclected);
                          },
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 5),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width / 1.36,
                                        child: Text(
                                          places.placePrediction[index]
                                              .description!,
                                          style: style.copyWith(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width / 1.36,
                                        child: Text(
                                          places
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
                                        unselectedWidgetColor: AppColor
                                            .lightBlack
                                            .withOpacity(0.2),
                                      ),
                                      child: Checkbox(
                                        shape: const CircleBorder(),
                                        value: places.getLocation ==
                                            places.placePrediction[index]
                                                .description,
                                        checkColor: AppColor.white,
                                        activeColor: AppColor.primaryColor,
                                        onChanged: (value) {
                                          setState(
                                            () => _isSeclected = places
                                                .placePrediction[index]
                                                .description!,
                                          );
                                          places.setlocation(_isSeclected);
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
                ),
              ),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.bottomCenter,
          child: MainButton(
            backgroundColor: (_isSeclected.isNotEmpty)
                ? AppColor.primaryColor
                : AppColor.primaryColorLight,
            borderColor: Colors.transparent,
            onTap: _isSeclected.isEmpty
                ? null
                : () {
                    places.placePrediction.clear();
                    widget.controller.animateToPage(
                      widget.index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  },
            child: Text(
              'CONTINUE',
              style: TextStyle(
                fontSize: 12,
                color: (_isSeclected.isNotEmpty)
                    ? AppColor.white
                    : AppColor.lightGrey.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 25),
      ],
    );
  }
}
