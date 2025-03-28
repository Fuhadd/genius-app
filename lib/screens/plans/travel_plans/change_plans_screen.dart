import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/screens/plans/widgets/my_plans_container_color.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class ChangePlansScreen extends StatefulWidget {
  const ChangePlansScreen({
    super.key,
  });

  @override
  State<ChangePlansScreen> createState() => _ChangePlansScreenState();
}

class _ChangePlansScreenState extends State<ChangePlansScreen>
    with SingleTickerProviderStateMixin {
  HealthPlans? selectedNewHealthPlan;
  HealthPlans selectedHealthPlans = HealthPlans.flexicare;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    ConstantString.backButtonIcon,
                  ),
                ),
              ],
            ),
            verticalSpacer(23.h),
            semiBoldText(
              'Change Plan',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Upgrade or Downgrade your current plan',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
            Container(
              height: 45.h,
              constraints: const BoxConstraints(maxWidth: 400, minHeight: 48),
              decoration: BoxDecoration(
                color: CustomColors.formBgColor,
                borderRadius: BorderRadius.circular(60),
              ),
              child: TabBar(
                controller: _tabController,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                dividerHeight: 0,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  // You can adjust the indicator color as needed.
                  color: Colors.white,
                ),
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 4,
                ),
                onTap: (int mode) {
                  print(mode);
                  setState(() {
                    selectedHealthPlans = mode == 0
                        ? HealthPlans.flexicare
                        : selectedHealthPlans = mode == 1
                            ? HealthPlans.zencare
                            : HealthPlans.primecare;
                    // phoneNumber = null;
                  });
                },
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          selectedHealthPlans == HealthPlans.flexicare
                              ? ConstantString.pinkHealthIcon
                              : ConstantString.greyHealthIcon,
                        ),
                        horizontalSpacer(6.w),
                        semiBoldText(
                          'FlexiCare',
                          fontSize: 14.sp,
                          color: selectedHealthPlans == HealthPlans.flexicare
                              ? CustomColors.blackTextColor
                              : CustomColors.grey500Color,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          selectedHealthPlans == HealthPlans.zencare
                              ? ConstantString.blueHealthIcon
                              : ConstantString.greyHealthIcon,
                        ),
                        horizontalSpacer(6.w),
                        semiBoldText(
                          'ZenCare',
                          fontSize: 14.sp,
                          color: selectedHealthPlans == HealthPlans.zencare
                              ? CustomColors.blackTextColor
                              : CustomColors.grey500Color,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          selectedHealthPlans == HealthPlans.primecare
                              ? ConstantString.purpleHealthIcon
                              : ConstantString.greyHealthIcon,
                        ),
                        horizontalSpacer(6.w),
                        semiBoldText(
                          'PrimeCare',
                          fontSize: 14.sp,
                          color: selectedHealthPlans == HealthPlans.primecare
                              ? CustomColors.blackTextColor
                              : CustomColors.grey500Color,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Content for the SMS tab.
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpacer(28.h),
                        Row(
                          children: [
                            FlexicareMiniContainer(
                              isSelected: selectedNewHealthPlan ==
                                  HealthPlans.flexicareMini,
                              onTap: () {
                                setState(() {
                                  if (selectedNewHealthPlan ==
                                      HealthPlans.flexicareMini) {
                                    selectedNewHealthPlan = null;
                                  } else {
                                    selectedNewHealthPlan =
                                        HealthPlans.flexicareMini;
                                  }
                                });
                              },
                            ),
                            // HealthPlanDetailsContainer(),
                          ],
                        ),
                        verticalSpacer(32.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColors.grey100Color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.r),
                                  topRight: Radius.circular(8.r),
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 6.h,
                              ),
                              child: semiBoldText(
                                'Current Plan',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: CustomColors.bgWhiteColor,
                              border: Border.all(
                                color: CustomColors.grey100Color,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8.r),
                                bottomLeft: Radius.circular(8.r),
                                topRight: Radius.circular(8.r),
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 20.h),
                            child: Row(
                              children: [
                                semiBoldText(
                                  'FlexiCare',
                                  fontSize: 16.sp,
                                  color: CustomColors.blackTextColor,
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: CustomColors.whiteColor,
                                      border: Border.all(
                                        color: CustomColors.grey50Color,
                                      ),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 5.w,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "₦",
                                              style: TextStyle(
                                                fontFamily: '',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color:
                                                    CustomColors.grey800Color,
                                              )),
                                          TextSpan(
                                            text: "7,000",
                                            style: CustomTextStyles.bold(
                                              fontSize: 14.sp,
                                              color: CustomColors.grey800Color,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "/ month",
                                            style: CustomTextStyles.semiBold(
                                              fontSize: 12.sp,
                                              color: CustomColors.grey800Color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpacer(60.h),
                        CustomButton(
                          title: 'Compare plans',
                          onTap: selectedNewHealthPlan == null
                              ? null
                              : () {
                                  context.pushReplacementNamed(
                                    RouteConstants.comparePlansTableScreen,
                                  );
                                },
                        ),
                        verticalSpacer(
                            MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),
                  // Content for the WhatsApp tab.
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpacer(28.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ZencareContainer(
                                isSelected: selectedNewHealthPlan ==
                                    HealthPlans.zencare,
                                onTap: () {
                                  setState(() {
                                    if (selectedNewHealthPlan ==
                                        HealthPlans.zencare) {
                                      selectedNewHealthPlan = null;
                                    } else {
                                      selectedNewHealthPlan =
                                          HealthPlans.zencare;
                                    }
                                  });
                                },
                              ),
                              horizontalSpacer(10.w),
                              ZencarePlusContainer(
                                isSelected: selectedNewHealthPlan ==
                                    HealthPlans.zencarePlus,
                                onTap: () {
                                  setState(() {
                                    if (selectedNewHealthPlan ==
                                        HealthPlans.zencarePlus) {
                                      selectedNewHealthPlan = null;
                                    } else {
                                      selectedNewHealthPlan =
                                          HealthPlans.zencarePlus;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(32.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColors.grey100Color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.r),
                                  topRight: Radius.circular(8.r),
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 6.h,
                              ),
                              child: semiBoldText(
                                'Current Plan',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: CustomColors.bgWhiteColor,
                              border: Border.all(
                                color: CustomColors.grey100Color,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8.r),
                                bottomLeft: Radius.circular(8.r),
                                topRight: Radius.circular(8.r),
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 20.h),
                            child: Row(
                              children: [
                                semiBoldText(
                                  'FlexiCare',
                                  fontSize: 16.sp,
                                  color: CustomColors.blackTextColor,
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: CustomColors.whiteColor,
                                      border: Border.all(
                                        color: CustomColors.grey50Color,
                                      ),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 5.w,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "₦",
                                              style: TextStyle(
                                                fontFamily: '',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color:
                                                    CustomColors.grey800Color,
                                              )),
                                          TextSpan(
                                            text: "7,000",
                                            style: CustomTextStyles.bold(
                                              fontSize: 14.sp,
                                              color: CustomColors.grey800Color,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "/ month",
                                            style: CustomTextStyles.semiBold(
                                              fontSize: 12.sp,
                                              color: CustomColors.grey800Color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpacer(60.h),
                        CustomButton(
                          title: 'Compare plans',
                          onTap: selectedNewHealthPlan == null
                              ? null
                              : () {
                                  context.pushReplacementNamed(
                                    RouteConstants.comparePlansTableScreen,
                                  );
                                },
                        ),
                        verticalSpacer(
                            MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpacer(28.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              PrimeCareContainer(
                                isSelected: selectedNewHealthPlan ==
                                    HealthPlans.primecare,
                                onTap: () {
                                  setState(() {
                                    if (selectedNewHealthPlan ==
                                        HealthPlans.primecare) {
                                      selectedNewHealthPlan = null;
                                    } else {
                                      selectedNewHealthPlan =
                                          HealthPlans.primecare;
                                    }
                                  });
                                },
                              ),
                              horizontalSpacer(10.w),
                              PrimeCarePlusContainer(
                                isSelected: selectedNewHealthPlan ==
                                    HealthPlans.primecarePlus,
                                onTap: () {
                                  setState(() {
                                    if (selectedNewHealthPlan ==
                                        HealthPlans.primecarePlus) {
                                      selectedNewHealthPlan = null;
                                    } else {
                                      selectedNewHealthPlan =
                                          HealthPlans.primecarePlus;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(32.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColors.grey100Color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.r),
                                  topRight: Radius.circular(8.r),
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 6.h,
                              ),
                              child: semiBoldText(
                                'Current Plan',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: CustomColors.bgWhiteColor,
                              border: Border.all(
                                color: CustomColors.grey100Color,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8.r),
                                bottomLeft: Radius.circular(8.r),
                                topRight: Radius.circular(8.r),
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 20.h),
                            child: Row(
                              children: [
                                semiBoldText(
                                  'FlexiCare',
                                  fontSize: 16.sp,
                                  color: CustomColors.blackTextColor,
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: CustomColors.whiteColor,
                                      border: Border.all(
                                        color: CustomColors.grey50Color,
                                      ),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 5.w,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "₦",
                                              style: TextStyle(
                                                fontFamily: '',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color:
                                                    CustomColors.grey800Color,
                                              )),
                                          TextSpan(
                                            text: "7,000",
                                            style: CustomTextStyles.bold(
                                              fontSize: 14.sp,
                                              color: CustomColors.grey800Color,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "/ month",
                                            style: CustomTextStyles.semiBold(
                                              fontSize: 12.sp,
                                              color: CustomColors.grey800Color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpacer(60.h),
                        CustomButton(
                          title: 'Compare plans',
                          onTap: selectedNewHealthPlan == null
                              ? null
                              : () {
                                  context.pushReplacementNamed(
                                    RouteConstants.comparePlansTableScreen,
                                  );
                                },
                        ),
                        verticalSpacer(
                            MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlexicareMiniContainer extends StatelessWidget {
  // final String title, subtitle, benefit
  final bool isSelected;
  final void Function()? onTap;
  const FlexicareMiniContainer({
    super.key,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280.w,
        decoration: BoxDecoration(
          color:
              isSelected ? CustomColors.green25Color : CustomColors.whiteColor,
          border: Border.all(
            color: isSelected
                ? CustomColors.green500Color
                : CustomColors.grey50Color,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                ConstantString.flexicareMiniIllus,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: semiBoldText(
                          'FlexiCare Mini',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                        ),
                      ),
                      SvgPicture.asset(
                        isSelected
                            ? ConstantString.selectedDowngradeIcon
                            : ConstantString.downgradeIcon,
                      ),
                    ],
                  ),
                  verticalSpacer(4.h),
                  mediumText(
                    'Essential healthcare consultations, physiotherapy & surgeries for you.',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                  ),
                  verticalSpacer(24.h),
                  PlanBenefitText(
                    title: 'General & specialist consultations',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '24/7 telemedicine access',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Physiotherapy (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "₦15,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Family planning-contraceptives (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "7,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(54.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColors.green50Color,
                          border: Border.all(
                            color: CustomColors.green450Color,
                          ),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 31.w, vertical: 5.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.sp,
                                    color: CustomColors.green400Color,
                                  )),
                              TextSpan(
                                text: "2,000",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "/ month",
                                style: CustomTextStyles.medium(
                                  fontSize: 14.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ZencareContainer extends StatelessWidget {
  // final String title, subtitle, benefit
  final bool isSelected;
  final void Function()? onTap;
  const ZencareContainer({
    super.key,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280.w,
        decoration: BoxDecoration(
          color:
              isSelected ? CustomColors.green25Color : CustomColors.whiteColor,
          border: Border.all(
            color: isSelected
                ? CustomColors.green500Color
                : CustomColors.grey50Color,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                ConstantString.zencareIllus,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: semiBoldText(
                          'ZenCare',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                        ),
                      ),
                      SvgPicture.asset(
                        isSelected
                            ? ConstantString.selectedDowngradeIcon
                            : ConstantString.downgradeIcon,
                      ),
                    ],
                  ),
                  verticalSpacer(4.h),
                  mediumText(
                    'Premium care with surgery, cancer support, and physiotherapy , HIV care and treatment services.',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                  ),
                  verticalSpacer(24.h),
                  PlanBenefitText(
                    title: 'General & specialist consultations',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '24/7 telemedicine access',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Surgery coverage (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "200,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Cancer care (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "300,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(54.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColors.green50Color,
                          border: Border.all(
                            color: CustomColors.green450Color,
                          ),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 31.w, vertical: 5.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.sp,
                                    color: CustomColors.green400Color,
                                  )),
                              TextSpan(
                                text: "2,000",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "/ month",
                                style: CustomTextStyles.medium(
                                  fontSize: 14.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ZencarePlusContainer extends StatelessWidget {
  // final String title, subtitle, benefit
  final bool isSelected;
  final void Function()? onTap;
  const ZencarePlusContainer({
    super.key,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280.w,
        decoration: BoxDecoration(
          color:
              isSelected ? CustomColors.green25Color : CustomColors.whiteColor,
          border: Border.all(
            color: isSelected
                ? CustomColors.green500Color
                : CustomColors.grey50Color,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                ConstantString.zencarePlusIllus,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: semiBoldText(
                          'ZenCare Plus',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                        ),
                      ),
                      SvgPicture.asset(
                        isSelected
                            ? ConstantString.selectedDowngradeIcon
                            : ConstantString.downgradeIcon,
                      ),
                    ],
                  ),
                  verticalSpacer(4.h),
                  mediumText(
                    'Advanced health coverage with surgeries, cancer care, wellness, and fitness benefits.',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                  ),
                  verticalSpacer(24.h),
                  PlanBenefitText(
                    title: 'General & specialist consultations',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '24/7 telemedicine access',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Surgery coverage (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "500,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Cancer care (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "750,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(54.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColors.green50Color,
                          border: Border.all(
                            color: CustomColors.green450Color,
                          ),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 31.w, vertical: 5.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.sp,
                                    color: CustomColors.green400Color,
                                  )),
                              TextSpan(
                                text: "2,000",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "/ month",
                                style: CustomTextStyles.medium(
                                  fontSize: 14.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimeCareContainer extends StatelessWidget {
  // final String title, subtitle, benefit
  final bool isSelected;
  final void Function()? onTap;
  const PrimeCareContainer({
    super.key,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280.w,
        decoration: BoxDecoration(
          color:
              isSelected ? CustomColors.green25Color : CustomColors.whiteColor,
          border: Border.all(
            color: isSelected
                ? CustomColors.green500Color
                : CustomColors.grey50Color,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                ConstantString.primecareIllus,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: semiBoldText(
                          'PrimeCare',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                        ),
                      ),
                      SvgPicture.asset(
                        isSelected
                            ? ConstantString.selectedUpgradeIcon
                            : ConstantString.upgradeIcon,
                      ),
                    ],
                  ),
                  verticalSpacer(4.h),
                  mediumText(
                    'Specialist care, surgeries, ICU admission, and extensive maternity and cancer coverage.',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                  ),
                  verticalSpacer(24.h),
                  PlanBenefitText(
                    title: 'General & specialist consultations',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Surgery coverage (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "2,500,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: 'ICU admission (7 days)',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Cancer care (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "2,000,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(54.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColors.green50Color,
                          border: Border.all(
                            color: CustomColors.green450Color,
                          ),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 31.w, vertical: 5.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.sp,
                                    color: CustomColors.green400Color,
                                  )),
                              TextSpan(
                                text: "30,000",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "/ month",
                                style: CustomTextStyles.medium(
                                  fontSize: 14.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimeCarePlusContainer extends StatelessWidget {
  // final String title, subtitle, benefit
  final bool isSelected;
  final void Function()? onTap;
  const PrimeCarePlusContainer({
    super.key,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280.w,
        decoration: BoxDecoration(
          color:
              isSelected ? CustomColors.green25Color : CustomColors.whiteColor,
          border: Border.all(
            color: isSelected
                ? CustomColors.green500Color
                : CustomColors.grey50Color,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                ConstantString.primecarePlusIllus,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: semiBoldText(
                          'PrimeCare Plus',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                        ),
                      ),
                      SvgPicture.asset(
                        isSelected
                            ? ConstantString.selectedUpgradeIcon
                            : ConstantString.upgradeIcon,
                      ),
                    ],
                  ),
                  verticalSpacer(4.h),
                  mediumText(
                    'Specialist care, surgeries, ICU admission, and extensive maternity and cancer coverage.',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                  ),
                  verticalSpacer(24.h),
                  PlanBenefitText(
                    title: 'General & specialist consultations',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Surgery coverage (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "2,500,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: 'ICU admission (7 days)',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Cancer care (",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                          TextSpan(
                              text: "₦",
                              style: TextStyle(
                                fontFamily: '',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              )),
                          TextSpan(
                            text: "2,000,000)",
                            style: CustomTextStyles.medium(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(54.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColors.green50Color,
                          border: Border.all(
                            color: CustomColors.green450Color,
                          ),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 31.w, vertical: 5.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.sp,
                                    color: CustomColors.green400Color,
                                  )),
                              TextSpan(
                                text: "60,000",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "/ month",
                                style: CustomTextStyles.medium(
                                  fontSize: 14.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanBenefitText extends StatelessWidget {
  final String title;
  final Widget? titleBody;
  final bool isSelected;
  const PlanBenefitText({
    super.key,
    required this.title,
    required this.isSelected,
    this.titleBody,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          isSelected
              ? ConstantString.selectedTickCircle
              : ConstantString.tickCircle,
        ),
        horizontalSpacer(8.w),
        Expanded(
          child: titleBody ??
              mediumText(
                title,
                fontSize: 12.sp,
                color: CustomColors.grey600Color,
              ),
        ),
      ],
    );
  }
}
