import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class AccountVerifiedScreen extends StatefulWidget {
  const AccountVerifiedScreen({super.key});

  @override
  State<AccountVerifiedScreen> createState() => _AccountVerifiedScreenState();
}

class _AccountVerifiedScreenState extends State<AccountVerifiedScreen> {
  AccountType? accountType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20),
            Center(
              child: Image.asset(
                ConstantString.geniusLogoGreen,
                height: 43,
              ),
            ),
            verticalSpacer(40.h),
            boldText(
              'Genius greetings Chidinma!',
              fontSize: 24.sp,
              color: CustomColors.green400Color,
              textAlign: TextAlign.center,
            ),
            verticalSpacer(12.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: mediumText(
                  'Your account is verified. We would love you to answer some questions to get you started on your journey to protection and security.',
                  fontSize: 16.sp,
                  color: CustomColors.grey600Color,
                  textAlign: TextAlign.center),
            ),
            verticalSpacer(35.h),
            // SvgPicture.asset(ConstantString.rotatingGraphics),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  bottom: -50,
                  child: SvgPicture.asset(ConstantString.treeRoot),
                ),
                RotatingSvg(),
                SvgPicture.asset(ConstantString.checkmark),
              ],
            ),
            Spacer(),
            CustomButton(
                title: 'Continue',
                onTap: () {
                  context.goNamed(RouteConstants.secondOnboardingScreen);
                }),
            // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class RotatingSvg extends StatefulWidget {
  const RotatingSvg({super.key});

  @override
  _RotatingSvgState createState() => _RotatingSvgState();
}

class _RotatingSvgState extends State<RotatingSvg>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 6500),
    )..repeat(); // This makes it rotate continuously
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: SvgPicture.asset(ConstantString.rotatingGraphics),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:genius_app/constants/custom_colors.dart';
// import 'package:genius_app/constants/custom_string.dart';
// import 'package:genius_app/constants/route_constants.dart';
// import 'package:genius_app/screens/onboarding/widgets/second_onboarding_page.dart';
// import 'package:genius_app/utils/enum.dart';
// import 'package:genius_app/utils/spacers.dart';
// import 'package:genius_app/widgets/animated_list_selector.dart';
// import 'package:genius_app/widgets/custom_button.dart';
// import 'package:genius_app/widgets/custom_text_widget.dart';
// import 'package:go_router/go_router.dart';

// class AccountVerifiedScreen extends StatefulWidget {
//   const AccountVerifiedScreen({super.key});

//   @override
//   State<AccountVerifiedScreen> createState() => _AccountVerifiedScreenState();
// }

// class _AccountVerifiedScreenState extends State<AccountVerifiedScreen>
//     with SingleTickerProviderStateMixin {
//   AccountType? accountType;
//   late AnimationController _buttonAnimationController;
//   late Animation<Offset> _buttonSlideAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation controller for the button exit animation
//     _buttonAnimationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );

//     // Define the slide animation from current position to below screen
//     _buttonSlideAnimation = Tween<Offset>(
//       begin: Offset.zero,
//       end: const Offset(0, 3), // Move 2x the height downward (off screen)
//     ).animate(CurvedAnimation(
//       parent: _buttonAnimationController,
//       curve: Curves.easeInCubic, // Fast exit curve
//     ));
//   }

//   @override
//   void dispose() {
//     _buttonAnimationController.dispose();
//     super.dispose();
//   }

//   // Function to handle the transition with animation
//   void _navigateToNextScreen() async {
//     // Start the button slide-out animation
//     _buttonAnimationController.forward();

//     // Wait for the animation to complete before navigation
//     await Future.delayed(const Duration(milliseconds: 50));

//     // Navigate to the next screen with fade transition
//     if (mounted) {
//       context.goNamed(RouteConstants.secondOnboardingScreen);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           children: [
//             verticalSpacer(MediaQuery.of(context).padding.top + 20),
//             Center(
//               child: Image.asset(
//                 ConstantString.geniusLogoGreen,
//                 height: 43,
//               ),
//             ),
//             verticalSpacer(40.h),
//             boldText(
//               'Genius greetings Chidinma!',
//               fontSize: 24.sp,
//               color: CustomColors.green400Color,
//               textAlign: TextAlign.center,
//             ),
//             verticalSpacer(12.h),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5.0),
//               child: mediumText(
//                   'Your account is verified. We would love you to answer some questions to get you started on your journey to protection and security.',
//                   fontSize: 16.sp,
//                   color: CustomColors.grey600Color,
//                   textAlign: TextAlign.center),
//             ),
//             verticalSpacer(35.h),
//             // SvgPicture.asset(ConstantString.rotatingGraphics),
//             Stack(
//               clipBehavior: Clip.none,
//               alignment: AlignmentDirectional.center,
//               children: [
//                 Positioned(
//                   bottom: -50,
//                   child: SvgPicture.asset(ConstantString.treeRoot),
//                 ),
//                 RotatingSvg(),
//                 SvgPicture.asset(ConstantString.checkmark),
//               ],
//             ),
//             Spacer(),
//             SlideTransition(
//               position: _buttonSlideAnimation,
//               child: CustomButton(
//                 title: 'Continue',
//                 onTap:
//                     _navigateToNextScreen, // Use our custom navigation function
//               ),
//             ),
//             // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RotatingSvg extends StatefulWidget {
//   const RotatingSvg({super.key});

//   @override
//   _RotatingSvgState createState() => _RotatingSvgState();
// }

// class _RotatingSvgState extends State<RotatingSvg>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 6500),
//     )..repeat(); // This makes it rotate continuously
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RotationTransition(
//       turns: _controller,
//       child: SvgPicture.asset(ConstantString.rotatingGraphics),
//     );
//   }
// }
