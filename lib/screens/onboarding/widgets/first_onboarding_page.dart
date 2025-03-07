import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

import '../../../constants/custom_colors.dart';
import '../../../utils/spacers.dart';

class FirstOnboardingPage extends StatelessWidget {
  static const routeName = '/firstOnboardingScreen';
  const FirstOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Image.asset(
              ConstantString.firstAnimation,
              height: 230.h,
              // color: CustomColors.navBarGrey
            ),
          ),
        ),
        // Expanded(
        //   child: Center(
        //     child: Stack(
        //       clipBehavior: Clip.none,
        //       alignment: Alignment.center,
        //       children: [
        //         // Positioned(
        //         //   bottom: 0,
        //         //   top: 0,
        //         //   child: Container(
        //         //     height: 240.h,
        //         //     width: 240.w,
        //         //     decoration: BoxDecoration(
        //         //       color: CustomColors.lightOrangeColor,
        //         //       shape: BoxShape.circle,
        //         //     ),
        //         //   ),
        //         // ),
        //         Image.asset(
        //           ConstantString.firstAnimation,
        //           height: 230,
        //           // color: CustomColors.navBarGrey
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // verticalSpacer(20),
        // Text(
        //   'Think MyCover, think easy life',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: Color(0xFF1A473F),
        //     fontSize: 24,
        //     fontFamily: 'Visby',
        //     fontWeight: FontWeight.w500,
        //     height: 1.40,
        //     letterSpacing: -0.60,
        //   ),
        // ),
        verticalSpacer(30),
        Center(
          child: boldText(
            'Think MyCover, think easy life',
            fontSize: 24.sp,
            color: CustomColors.green400Color,
            textAlign: TextAlign.center,
            height: 1.40,
            letterSpacing: -0.60,
          ),
        ),
        verticalSpacer(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SizedBox(
            width: 333.w,
            child: mediumText(
              'Easy life starts with your health, vehicles, gadgets, and trips that are always protected.',
              fontSize: 16.sp,
              color: CustomColors.primaryGreenColor,
              textAlign: TextAlign.center,
              height: 1.40,
              letterSpacing: 0,
            ),
          ),
        ),
      ],
    );
  }
}
