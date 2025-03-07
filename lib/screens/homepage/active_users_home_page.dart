import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/screens/homepage/widgets/other_product_container.dart';
import 'package:genius_app/screens/homepage/widgets/plans_count_container.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class ActiveUsersHomePage extends StatelessWidget {
  const ActiveUsersHomePage({
    super.key,
  });

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else if (hour < 20) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  String getEmoji() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "☀️";
    } else if (hour < 17) {
      return "🌤️";
    } else if (hour < 20) {
      return "🌆";
    } else {
      return "🌙";
    }
  }

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
                      child: ClipOval(
                        child: Image.asset(
                          ConstantString.profileImage,
                          fit: BoxFit.cover,
                        ),

                        //  SvgPicture.asset(
                        //   ConstantString.profileIcon,
                        // ),
                      ),
                    ),
                    horizontalSpacer(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mediumText(
                          getGreeting(),
                          color: CustomColors.primaryGreenColor,
                          fontSize: 12.sp,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Chidinma ",
                                style: CustomTextStyles.bold(
                                  color: CustomColors.primaryGreenColor,
                                  fontSize: 20.sp,
                                ),
                              ),
                              TextSpan(
                                text: getEmoji(),
                                style: CustomTextStyles.bold(
                                  color: CustomColors.primaryGreenColor,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
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
                                    text: "2,000",
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColors.lightOrangeColor,
                        border: Border.all(
                          color: CustomColors.orange500Color,
                          width: 0.4.w,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 13.h),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              ConstantString.orangeCautionIcon,
                            ),
                            horizontalSpacer(12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                semiBoldText(
                                  'Activate FlexiCare',
                                  fontSize: 14.sp,
                                  color: CustomColors.newGreenTextColor,
                                ),
                                mediumText(
                                  'This is important to access care',
                                  fontSize: 12.sp,
                                  color: CustomColors.grey800Color,
                                )
                              ],
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              ConstantString.orangeCloseIcon,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpacer(32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: PlansCountContainer(
                            title: 'My Plans',
                            icon: ConstantString.groupedPlansIcon,
                            count: "4",
                            bgColor: CustomColors.green240Color,
                          ),
                        ),
                        horizontalSpacer(15.w),
                        Expanded(
                          child: PlansCountContainer(
                            title: 'Total Claims',
                            icon: ConstantString.groupedClaimsIcon,
                            count: "2",
                            bgColor: CustomColors.orange100Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(48.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        CircularOptionsContainer(
                          icon: ConstantString.buyPlanIcon,
                          title: 'Buy Plan',
                        ),
                        horizontalSpacer(16.w),
                        CircularOptionsContainer(
                          icon: ConstantString.renewPlanIcon,
                          title: 'Renew Plan',
                        ),
                        horizontalSpacer(16.w),
                        CircularOptionsContainer(
                          icon: ConstantString.fundWalletIcon,
                          title: 'Fund Wallet',
                        ),
                        horizontalSpacer(16.w),
                        CircularOptionsContainer(
                          icon: ConstantString.makeClaimIcon,
                          title: 'Make Claim',
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(48.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        boldText(
                          'My key actions',
                          fontSize: 16.sp,
                          color: CustomColors.primaryGreenColor,
                        ),
                        Row(
                          children: [
                            semiBoldText(
                              'View All',
                              fontSize: 14.sp,
                              color: CustomColors.green500Color,
                            ),
                            horizontalSpacer(4.w),
                            SvgPicture.asset(
                              ConstantString.chevronRight,
                              color: CustomColors.green500Color,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(17.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: KeyActionContainer(
                      title: 'Activate FlexiCare',
                      subtitle: 'Activating this plan is needed to access care',
                      icon: ConstantString.activateIcon,
                    ),
                  ),
                  verticalSpacer(12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: KeyActionContainer(
                      title: 'Set Up Notifications',
                      subtitle: 'Set up notifications to receive updates',
                      icon: ConstantString.pinkNotificationBell,
                    ),
                  ),
                  verticalSpacer(48.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        boldText(
                          'My Plans',
                          fontSize: 16.sp,
                          color: CustomColors.primaryGreenColor,
                        ),
                        Row(
                          children: [
                            semiBoldText(
                              'View All',
                              fontSize: 14.sp,
                              color: CustomColors.green500Color,
                            ),
                            horizontalSpacer(4.w),
                            SvgPicture.asset(
                              ConstantString.chevronRight,
                              color: CustomColors.green500Color,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(16.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        child: Row(
                          children: [
                            MyPlansContainer(
                              title: 'PrimeCare',
                              premium: '30,000',
                              expiryDate: '12/12/2025',
                              icon: ConstantString.primecareIcon,
                              iconColor: CustomColors.pink50Color,
                            ),
                            horizontalSpacer(14.w),
                            MyPlansContainer(
                              title: 'Comprehensive',
                              premium: '30,000',
                              expiryDate: '12/12/2025',
                              icon: ConstantString.autoIcon,
                              iconColor: CustomColors.orange50Color,
                            ),
                          ],
                        ),
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
                          'Check out these recommended products',
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
                                      // height: 43,
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

class KeyActionContainer extends StatelessWidget {
  final String title, subtitle, icon;
  const KeyActionContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 64.h,
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.005), // Subtle shadow color
            blurRadius: 2, // Softness of the shadow
            spreadRadius: 1, // Slight expansion
            offset: Offset(0, 1), // Vertical movement of the shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 28.h,
            ),
            horizontalSpacer(12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                semiBoldText(
                  title,
                  fontSize: 14.sp,
                  color: CustomColors.newGreenTextColor,
                ),
                mediumText(
                  subtitle,
                  fontSize: 10.sp,
                  color: CustomColors.grey800Color,
                )
              ],
            ),
            Spacer(),
            SvgPicture.asset(
              ConstantString.chevronRightRound,
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CircularOptionsContainer extends StatelessWidget {
  final String icon, title;
  const CircularOptionsContainer({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            // height: 78.h,
            decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                ),
              ),
            ),
          ),
          verticalSpacer(8.h),
          semiBoldText(
            title,
            fontSize: 12.sp,
            color: CustomColors.grey800Color,
          ),
        ],
      ),
    );
  }
}

class MyPlansContainer extends StatelessWidget {
  final String title, expiryDate, premium, icon;
  final Color iconColor;
  const MyPlansContainer({
    super.key,
    required this.title,
    required this.expiryDate,
    required this.premium,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 64.h,
      width: 260.w,
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.005), // Subtle shadow color
            blurRadius: 2, // Softness of the shadow
            spreadRadius: 1, // Slight expansion
            offset: Offset(0, 1), // Vertical movement of the shadow
          ),

          // BoxShadow(
          //   color: Colors.black.withOpacity(0.05), // Subtle shadow color
          //   blurRadius: 4, // Softness of the shadow
          //   spreadRadius: 1, // Slight expansion
          //   offset: Offset(0, 2), // Vertical movement of the shadow
          // ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 28.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      // height: 28.h,
                    ),
                  ),
                ),
                horizontalSpacer(12.w),
                semiBoldText(
                  title,
                  fontSize: 14.sp,
                  color: CustomColors.newGreenTextColor,
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: CustomColors.green50Color,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                    child: boldText(
                      'Active',
                      fontSize: 10.sp,
                      color: CustomColors.green500Color,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(23.h),
            Divider(
              color: CustomColors.grey50Color,
            ),
            verticalSpacer(20.h),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    regularText(
                      'Premium',
                      fontSize: 10.sp,
                      color: CustomColors.greenText100Color,
                    ),
                    verticalSpacer(5.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: CustomColors.greenText100Color,
                              )),
                          TextSpan(
                            text: premium,
                            style: CustomTextStyles.semiBold(
                              fontSize: 14.sp,
                              color: CustomColors.greenText100Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Spacer(),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    regularText(
                      'Expiry Date',
                      fontSize: 10.sp,
                      color: CustomColors.greenText100Color,
                    ),
                    verticalSpacer(5.h),
                    semiBoldText(
                      expiryDate,
                      fontSize: 14.sp,
                      color: CustomColors.greenText100Color,
                    ),
                  ],
                ))
              ],
            ),
            verticalSpacer(20.h),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    regularText(
                      'Dependants',
                      fontSize: 10.sp,
                      color: CustomColors.greenText100Color,
                    ),
                    verticalSpacer(5.h),
                    Row(
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.pink500Color,
                          ),
                          child: Center(
                            child: Image.asset(
                              ConstantString.femaleMemoji,
                              height: 18.h,
                            ),
                          ),
                        ),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.deepYellowColor,
                          ),
                          child: Center(
                            child: Image.asset(
                              ConstantString.maleMemoji,
                              height: 18.h,
                            ),
                          ),
                        ),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.black100Color,
                          ),
                          child: Center(
                            child: boldText(
                              '+3',
                              fontSize: 8.sp,
                              color: CustomColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
