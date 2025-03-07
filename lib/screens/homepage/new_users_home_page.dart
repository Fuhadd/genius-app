import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/screens/homepage/widgets/other_product_container.dart';
import 'package:genius_app/screens/homepage/widgets/plans_container.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class NewUsersHomePage extends StatelessWidget {
  const NewUsersHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Column(
        children: [
          verticalSpacer(MediaQuery.of(context).padding.top + 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 38.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.grey50Color,
                        border: Border.all(
                          color: CustomColors.grey100Color,
                          width: 0.79.w,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          ConstantString.profileIcon,
                        ),
                      ),
                    ),
                    horizontalSpacer(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mediumText(
                          'Welcome',
                          color: CustomColors.primaryGreenColor,
                          fontSize: 12.sp,
                        ),
                        boldText(
                          'Chidinma 👋🏼',
                          color: CustomColors.primaryGreenColor,
                          fontSize: 20.sp,
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      // height: 38.h,
                      decoration: BoxDecoration(
                          color: CustomColors.green100Color,
                          border: Border.all(
                            color: CustomColors.green200Color,
                          ),
                          borderRadius: BorderRadius.circular(200)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              ConstantString.walletIcon,
                            ),
                            horizontalSpacer(5.w),
                            // extraBoldText(
                            //   '₦0',
                            //   color: CustomColors.green500Color,
                            //   fontSize: 14.sp,
                            // ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "₦",
                                      style: TextStyle(
                                        fontFamily: '',
                                        fontWeight: FontWeight.w800,
                                        color: CustomColors.green500Color,
                                        fontSize: 14.sp,
                                      )),
                                  TextSpan(
                                    text: "0",
                                    style: CustomTextStyles.semiBold(
                                      color: CustomColors.green500Color,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    horizontalSpacer(8.w),
                    SvgPicture.asset(
                      ConstantString.bellIcon,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacer(35.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: mediumText(
                            'Here are recommendations based on your selection.',
                            fontSize: 14.sp,
                            color: CustomColors.grey800Color,
                          ),
                        ),
                        horizontalSpacer(40.w),
                        Container(
                          // height: 38.h,
                          decoration: BoxDecoration(
                              color: CustomColors.grey50Color,
                              // border: Border.all(
                              //   color: CustomColors.green200Color,
                              // ),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 11.w,
                              vertical: 8.h,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  ConstantString.autoIcon,
                                ),
                                horizontalSpacer(10.w),
                                semiBoldText(
                                  'Auto',
                                  color: CustomColors.blackTextColor,
                                  fontSize: 14.sp,
                                  height: 0.18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(16.h),
                  // PlansContainer(
                  //   title: 'Comprehensive Auto',
                  //   subtitle:
                  //       'Drive fully secured, offering own and third party protection from theft & damage.',
                  //   icon: ConstantString.wobbleCircle,
                  //   minPrice: "5%",
                  //   period: "/vehicle value",
                  //   bgColor: CustomColors.orange100Color,
                  // ),
                  SizedBox(
                    height: 250.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        PlansContainer(
                          title: 'Comprehensive Auto',
                          subtitle:
                              'Drive fully secured, offering own and third party protection from theft & damage.',
                          icon: ConstantString.comprehensiveAutoIcon,
                          minPrice: "5%",
                          period: "/vehicle value",
                          bgColor: CustomColors.orange100Color,
                        ),
                        PlansContainer(
                          title: 'Mini Comprehensive',
                          subtitle:
                              'Safety beyond yourself, covers minor and major repairs.',
                          icon: ConstantString.miniComprehensiveIcon,
                          minPrice: "25,000",
                          isCurrency: true,
                          period: "/annually",
                          bgColor: CustomColors.pink100Color,
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(48.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        boldText(
                          'Explore other products of your interest',
                          fontSize: 16.sp,
                          color: CustomColors.primaryGreenColor,
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(16.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                      height: 105.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          OtherProductContainer(
                            title: 'Health Cover',
                            icon: ConstantString.healthCoverIcon,
                          ),
                          OtherProductContainer(
                            title: 'Gadget Cover',
                            icon: ConstantString.gadgetCoverIcon,
                          ),
                          OtherProductContainer(
                            title: 'Travel Cover',
                            icon: ConstantString.travelCoverIcon,
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(48.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      height: 140.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.greenTextColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: SvgPicture.asset(
                              ConstantString.orangePercentageIcon,
                              // color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 20,
                            ),
                            child: Column(
                              children: [
                                Transform.rotate(
                                  angle: -2 * pi / 180,
                                  child: Row(
                                    children: [
                                      Container(
                                        // height: 36.h,
                                        decoration: BoxDecoration(
                                          color: CustomColors.yellow500Color,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                            vertical: 5.h,
                                          ),
                                          child: extraBoldText(
                                            '5% Discount',
                                            fontSize: 20.sp,
                                            color: CustomColors.orange500Color,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SvgPicture.asset(
                                            ConstantString.sparkleIcon,
                                            height: 18,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: SvgPicture.asset(
                                              ConstantString.sparkleIcon,
                                              height: 18,
                                              color:
                                                  CustomColors.orange500Color,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                verticalSpacer(10.h),
                                mediumText(
                                  'Save 5% of the premium on your first purchase',
                                  fontSize: 14.sp,
                                  color: CustomColors.grey25Color,
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      height: 28.h,
                                      width: 28.w,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          ConstantString.chevronRight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(48.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        boldText(
                          'What’s going on in MyCover? ',
                          fontSize: 16.sp,
                          color: CustomColors.primaryGreenColor,
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 160.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: CustomColors.whiteColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      ConstantString.manSmiling,
                                      height: 43,
                                    ),
                                  ),
                                  verticalSpacer(12.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: semiBoldText(
                                          'Are you new to insurance?',
                                          fontSize: 14.sp,
                                          color: CustomColors.newGreenTextColor,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SvgPicture.asset(
                                          ConstantString.chevronRight,
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        horizontalSpacer(15.w),
                        Expanded(
                          child: Container(
                            height: 160.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: CustomColors.whiteColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          6), // Adjust the radius as needed
                                      child: Image.asset(
                                        ConstantString.womanSmiling,
                                        width: double
                                            .infinity, // Take up available width
                                        height: double
                                            .infinity, // Take up available height
                                        fit: BoxFit
                                            .cover, // Ensures it fills the space while maintaining aspect ratio
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(12.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: semiBoldText(
                                          'Are you new to insurance?',
                                          fontSize: 14.sp,
                                          color: CustomColors.newGreenTextColor,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SvgPicture.asset(
                                          ConstantString.chevronRight,
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(48.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
