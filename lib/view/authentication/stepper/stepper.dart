import 'package:flutter/material.dart';
import 'package:nche/view/authentication/stepper/stepfour.dart';
import 'package:nche/view/authentication/stepper/stepone.dart';
import 'package:nche/view/authentication/stepper/stepthree.dart';
import 'package:nche/view/authentication/stepper/steptwo.dart';
import 'package:nche/widget/colors.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({Key? key}) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 15, left: 15),
            child: StepProgressIndicator(
              totalSteps: 4,
              currentStep: _currentStep + 1,
              padding: 4,
              selectedColor: AppColor.primaryColor,
              unselectedColor: AppColor.grey,
              roundedEdges: const Radius.circular(6),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                children: [
                  /// first slide
                  StepOne(
                    controller: controller,
                    index: _currentStep = 1,
                  ),

                  /// second slide
                  StepTwo(
                    controller: controller,
                    index: _currentStep += 1,
                  ),

                  /// third slide
                  StepThree(
                    controller: controller,
                    index: _currentStep += 1,
                  ),

                  /// Four slide
                  StepFour(
                    controller: controller,
                    index: _currentStep += 1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
