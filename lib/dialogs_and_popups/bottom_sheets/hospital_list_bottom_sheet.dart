import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

// Main widget for the screen
class HosipitalListBottomsheet extends StatelessWidget {
  const HosipitalListBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Section 1: Benefits after 24hrs of purchase
            verticalSpacer(32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ConstantString.hospitalIcon,
                ),
                horizontalSpacer(12.w),
                Column(
                  children: [
                    Text(
                      'Hospital List',
                      style: CustomTextStyles.bold(fontSize: 20.sp),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpacer(32.h),

            Container(
              height: 56.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.grey100Color),
                borderRadius: BorderRadius.circular(200.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: CustomTextStyles.medium(fontSize: 16.sp),
                      border: InputBorder.none,
                      prefixIcon: SvgPicture.asset(
                        ConstantString.searchIcon,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.scaleDown,
                      )),
                ),
              ),
            ),

            verticalSpacer(32.h),

            Container(
              height: 48.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: CustomColors.orange50Color,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      boldText('Hospitals', fontSize: 14.sp),
                      SizedBox(
                          width: 60.w), // Added spacing between text and icon
                      SvgPicture.asset(ConstantString.chevronDown),
                    ],
                  ),
                  Container(
                    height: 28.h,
                    width: 1.w,
                    color: CustomColors.orange100Color,
                  ),
                  Row(
                    children: [
                      boldText('All States', fontSize: 14.sp),
                      SizedBox(
                          width: 60.w), // Added spacing between text and icon
                      SvgPicture.asset(ConstantString.chevronDown),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpacer(10.h),

            Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.6),
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  semiBoldText(
                                    '45 NAF Hospital - Makurdi - ${index + 1}',
                                    fontSize: 14.sp,
                                  ),
                                  mediumText(
                                    '(Airforce base, Gboko road, Makurdi)',
                                    fontSize: 14.sp,
                                  )
                                ],
                              ),
                              Center(
                                child: semiBoldText('Lagos State'),
                              )
                            ],
                          ),
                        ),
                        Divider()
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

