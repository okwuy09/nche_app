import 'package:flutter/material.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class ReportPost extends StatefulWidget {
  const ReportPost({super.key});

  @override
  State<ReportPost> createState() => _ReportPostState();
}

class _ReportPostState extends State<ReportPost> {
  String selectedReason = '';

  List<String> reason = [
    'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum. Nisl venenatis egestas egestas quis sed amet nec in vestibulum. Maecenas rhoncus non sed in1.',
    'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum. Nisl venenatis egestas egestas quis sed amet nec in vestibulum. Maecenas rhoncus non sed in2.',
    'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum. Nisl venenatis egestas egestas quis sed amet nec in vestibulum. Maecenas rhoncus non sed in3.',
    'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum. Nisl venenatis egestas egestas quis sed amet nec in vestibulum. Maecenas rhoncus non sed in4.',
    'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum. Nisl venenatis egestas egestas quis sed amet nec in vestibulum. Maecenas rhoncus non sed in5.',
    'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum. Nisl venenatis egestas egestas quis sed amet nec in vestibulum. Maecenas rhoncus non sed in6.',
    'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum. Nisl venenatis egestas egestas quis sed amet nec in vestibulum. Maecenas rhoncus non sed in7.',
    'Lorem ipsum dolor sit amet consectetur. Nam dignissim varius a amet interdum. Nisl venenatis egestas egestas quis sed amet nec in vestibulum. Maecenas rhoncus non sed in8.',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        shadowColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        elevation: 0.5,
        title: Row(
          children: [
            const BackNav(),
            Expanded(child: Container()),
            Text(
              'Report Post',
              style: style.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Why are you reporting this Post?',
              style: style.copyWith(
                fontSize: 21,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: reason.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedReason = reason[index];
                        });
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 8, right: 2),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width / 1.2,
                              child: Text(
                                reason[index],
                                style: style.copyWith(
                                  fontSize: 14,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
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
                                  value: selectedReason == reason[index],
                                  checkColor: AppColor.white,
                                  activeColor: AppColor.primaryColor,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedReason = reason[index];
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MainButton(
              borderColor: Colors.transparent,
              backgroundColor: AppColor.primaryColor,
              onTap: () => {},
              child: Text(
                'Continue',
                style: style.copyWith(
                  fontSize: 14,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
