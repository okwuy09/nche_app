import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/homepage/bottom_navbar.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class StepFour extends StatefulWidget {
  final PageController? controller;
  final int? index;
  const StepFour({Key? key, this.controller, this.index}) : super(key: key);

  @override
  State<StepFour> createState() => _StepFourState();
}

//TextEditingController _code = TextEditingController();

class _StepFourState extends State<StepFour> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  final List<int> _code = [];

  List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0];

  bool showcode = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Form(
        key: _globalFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Text(
              'Set your passcode',
              style: style.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Choose a 4-digit pin',
              style: style.copyWith(
                fontSize: 14,
                color: AppColor.darkerGrey,
              ),
            ),

            /// Create team field
            SizedBox(height: size.height / 20),
            Container(
              height: 50,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      showcode = !showcode;
                    }),
                    child: Icon(
                      showcode ? Icons.lock_open_rounded : Icons.lock,
                      color: AppColor.lightBlack,
                    ),
                  ),
                  Expanded(child: Container()),
                  ListView.builder(
                    itemCount: _code.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Center(
                          child: showcode
                              ? Text(
                                  _code[i].toString(),
                                  style: style.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 4.5,
                                  backgroundColor: _code.isEmpty
                                      ? AppColor.lightBlack.withOpacity(0.3)
                                      : AppColor.black,
                                ),
                        ),
                      );
                    },
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            SizedBox(height: size.height / 12),

            /// Avatar thumbnail
            MediaQuery.removePadding(
              context: context,
              removeRight: true,
              removeLeft: true,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: number.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 75,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: index == 11
                        ? () {
                            /// navigate to home screen
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const BottomNavBar(),
                              ),
                            );
                          }
                        : index == 9
                            ? () {
                                // clear
                                setState(() {
                                  _code.clear();
                                });
                              }
                            : () => {
                                  _code.length == 4
                                      ? null
                                      : setState(() {
                                          _code.add(number[index]);
                                        })
                                },
                    child: Stack(
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            color: index == 11
                                ? AppColor.primaryColor
                                : index == 9
                                    ? null
                                    : AppColor.grey.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: index == 11
                              ? Icon(
                                  Icons.check_circle,
                                  color: AppColor.white,
                                )
                              : index == 9
                                  ? Icon(
                                      Icons.backspace_rounded,
                                      color: AppColor.black,
                                    )
                                  : Center(
                                      child: Text(
                                        number[index].toString(),
                                        style: style.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              AppColor.black.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
