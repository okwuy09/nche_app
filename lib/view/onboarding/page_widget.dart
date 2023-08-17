import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/onboarding/auth_bottomsheet.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      this.onTap,
      required this.percent,
      this.onTapSkip,
      required this.slideImage,
      required this.index,
      required this.title});
  final void Function()? onTap;
  final void Function()? onTapSkip;
  final int percent;
  final String title;
  final String slideImage;
  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColor.primaryColor,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: index == 4 ? null : onTapSkip,
              child: Container(
                height: 32,
                width: 60,
                margin: const EdgeInsets.only(right: 5),
                child: index == 3
                    ? Container()
                    : Center(
                        child: Text(
                          'Skip',
                          style: style.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            height: index == 3 ? 8 : 15,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              decoration: BoxDecoration(
                color: AppColor.white, //lightGrey,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              height: size.height / 2.4,
              width: size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  slideImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: size.height / 2.5,
            width: size.width,
            //color: AppColor.white,
            decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(color: AppColor.white),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      title,
                      style: style.copyWith(
                        fontSize: 22,
                        color: AppColor.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 100 - percent,
                    circularDirection: CircularDirection.counterclockwise,
                    selectedColor: AppColor.primaryColor.withOpacity(0.06),
                    unselectedColor: AppColor.primaryColor,
                    roundedCap: (_, __) => true,
                    customStepSize: (p0, p1) => 2.5,
                    padding: 0,
                    width: 90,
                    height: 90,
                    child: Center(
                      child: GestureDetector(
                        onTap: index == 3
                            ? () async {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (_) =>
                                      SignUpPopUpSheet(ctx: context),
                                );
                              }
                            : onTap,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColor.primaryColor,
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
