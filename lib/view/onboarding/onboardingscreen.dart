import 'package:flutter/material.dart';
import 'package:nche/view/onboarding/onbording_model.dart';
import 'package:nche/view/onboarding/page_widget.dart';
import '../../widget/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();

  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> items = [
      /// first slide
      const OnBoardingModel(
        index: 0,
        percent: 25,
        slideImage: 'assets/cctv.jpg',
        title: 'Catch up with emergencies & incidents happening around you',
      ),

      /// second slide
      const OnBoardingModel(
        index: 1,
        percent: 50,
        slideImage: 'assets/sec1.jpg',
        title:
            'Report incidents & emergencies directly to agencies fast and easily',
      ),

      /// third slide
      const OnBoardingModel(
        index: 2,
        percent: 75,
        slideImage: 'assets/sec.jpg',
        title: 'Get rewards & incentives when you help solve a case or crime',
      ),

      /// fouth slide
      const OnBoardingModel(
        index: 3,
        percent: 100,
        slideImage: 'assets/sec2.jpg',
        title: 'Your identity is yours alone, you never have to reveal it',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (index) => setState(() {
            pageIndex = index;
          }),
          children: [
            OnBoardingPage(
              index: pageIndex,
              percent: items[pageIndex].percent,
              slideImage: items[pageIndex].slideImage,
              title: items[pageIndex].title,
              onTap: () => _controller.animateToPage(
                pageIndex + 1,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
              onTapSkip: () => _controller.animateToPage(
                3,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
            ),
            OnBoardingPage(
              index: pageIndex,
              percent: items[pageIndex].percent,
              slideImage: items[pageIndex].slideImage,
              title: items[pageIndex].title,
              onTap: () => _controller.animateToPage(
                pageIndex + 1,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
              onTapSkip: () => _controller.animateToPage(
                3,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
            ),
            OnBoardingPage(
              index: pageIndex,
              percent: items[pageIndex].percent,
              slideImage: items[pageIndex].slideImage,
              title: items[pageIndex].title,
              onTap: () => _controller.animateToPage(
                pageIndex + 1,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
              onTapSkip: () => _controller.animateToPage(
                3,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
            ),
            OnBoardingPage(
              index: pageIndex,
              percent: items[pageIndex].percent,
              slideImage: items[pageIndex].slideImage,
              title: items[pageIndex].title,
              onTap: () => _controller.animateToPage(
                pageIndex + 1,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
              onTapSkip: () => _controller.animateToPage(
                3,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
