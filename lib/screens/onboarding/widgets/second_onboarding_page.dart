import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

import '../../../constants/custom_colors.dart';
import '../../../utils/spacers.dart';

class SecondOnboardingPage extends StatelessWidget {
  static const routeName = '/secondOnboardingScreen';
  const SecondOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Image.asset(
              ConstantString.secondAnimation,
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
        //         Positioned(
        //           bottom: 0,
        //           top: 0,
        //           child: Container(
        //             height: 240.h,
        //             width: 240.w,
        //             decoration: BoxDecoration(
        //               color: CustomColors.lightOrangeColor,
        //               shape: BoxShape.circle,
        //             ),
        //           ),
        //         ),
        //         Positioned(
        //           top: 20,
        //           left: 0,
        //           right: 0,
        //           child: Image.asset(
        //             ConstantString.secondAnimation,
        //             height: 230,
        //             // color: CustomColors.navBarGrey
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        // verticalSpacer(50),
        // boldText(
        //   'Holistic benefit on all plans!',
        //   fontSize: 26.sp,
        //   color: CustomColors.green400Color,
        //   textAlign: TextAlign.center,
        //   height: 1.1,
        // ),
        // verticalSpacer(20),
        // w500Text(
        //   'We offer flexible coverage designed to match every phase of your life.\n\n',
        //   fontSize: 18.sp,
        //   color: CustomColors.primaryGreenColor,
        //   textAlign: TextAlign.center,
        //   maxLines: 3,
        // ),

        verticalSpacer(30),
        Center(
          child: boldText(
            'Holistic benefit on all plans!',
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
              'We offer flexible coverage designed to match every phase of your life.\n\n',
              fontSize: 16.sp,
              color: CustomColors.primaryGreenColor,
              textAlign: TextAlign.center,
              height: 1.40,
              letterSpacing: 0,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
