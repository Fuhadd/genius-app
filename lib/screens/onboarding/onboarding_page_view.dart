import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/push_notification_bottom_sheet.dart';
import 'package:genius_app/screens/onboarding/widgets/fourth_onboarding_page.dart';
import 'package:genius_app/screens/onboarding/widgets/second_onboarding_page.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/custom_colors.dart';
import '../../utils/spacers.dart';
import 'widgets/first_onboarding_page.dart';
import 'widgets/third_onboarding_page.dart';

class OnboardingPageViewScreen extends StatefulWidget {
  static const routeName = '/OnboardingPageViewScreen';
  const OnboardingPageViewScreen({super.key});

  @override
  State<OnboardingPageViewScreen> createState() =>
      _OnboardingPageViewScreenState();
}

class _OnboardingPageViewScreenState extends State<OnboardingPageViewScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  // int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(40),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PageView(
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  // onPageChanged: (int page) {
                  //   setState(() {
                  //     _currentPage = page;
                  //   });
                  // },
                  children: const [
                    FirstOnboardingPage(),
                    SecondOnboardingPage(),
                    ThirdOnboardingPage(),
                    FourthOnboardingPage(),
                  ],
                ),
              ),
            ),

            verticalSpacer(30),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const ExpandingDotsEffect(
                  activeDotColor: CustomColors.green500Color,
                  dotColor: CustomColors.gray200Color,
                  dotHeight: 6,
                  dotWidth: 6,
                  spacing: 5,
                  expansionFactor: 4.5,
                  strokeWidth: 100,
                ),
              ),
            ),

            verticalSpacer(50.h),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                title: 'Get me started',
                onTap: () {
                  showHelpBottomSheet(context);
                  // showPushNotificationBottomSheet(context);
                },
              ),
            ),
            verticalSpacer(10),

            Expanded(
                // flex: 2,
                child: Image.asset(
              ConstantString.onboardingGraphics,
              fit: BoxFit.fill,

              // color: CustomColors.navBarGrey
            )),
          ],
        ),
      ),
    );
  }
}

class AnimatedPageIndicator extends StatefulWidget {
  final int pageCount;
  final double dotSize;
  final double indicatorRadius;
  final Color activeColor;
  final Color inactiveColor;

  const AnimatedPageIndicator({
    super.key,
    required this.pageCount,
    this.dotSize = 10.0,
    this.indicatorRadius = 30.0,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });

  @override
  _AnimatedPageIndicatorState createState() => _AnimatedPageIndicatorState();
}

class _AnimatedPageIndicatorState extends State<AnimatedPageIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0, end: widget.pageCount - 1).animate(_controller)
          ..addListener(() {
            setState(() {
              _currentPage = _animation.value.toInt();
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.pageCount, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: widget.dotSize,
                height: widget.dotSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? widget.activeColor
                        : widget.inactiveColor,
                  ),
                ),
              ),
            );
          }),
        ),
        Positioned(
          left: (_currentPage * (widget.dotSize * 2 + 16)) +
              widget.dotSize +
              (widget.dotSize / 2),
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: widget.indicatorRadius,
            height: widget.indicatorRadius,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.activeColor,
                boxShadow: [
                  BoxShadow(
                    color: widget.activeColor.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void goToPage(int page) {
    _controller.animateTo(
      page.toDouble(),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
