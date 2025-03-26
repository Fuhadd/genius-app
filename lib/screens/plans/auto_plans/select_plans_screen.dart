import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/auto_plan_details_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
// import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class SelectAutoPlanScreen extends StatefulWidget {
  const SelectAutoPlanScreen({
    super.key,
  });

  @override
  State<SelectAutoPlanScreen> createState() => _SelectAutoPlanScreenState();
}

class _SelectAutoPlanScreenState extends State<SelectAutoPlanScreen>
    with SingleTickerProviderStateMixin {
  AutoPlans? selectedNewAutoPlan;
  // HealthPlans selectedHealthPlans = HealthPlans.flexicare;

  late AnimationController _buttonAnimationController;
  late Animation<Offset> _buttonSlideAnimation;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for the button slide-in animation
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the slide animation from below screen to normal position
    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 2), // Start from below the screen
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: Curves.easeOutQuart, // Smooth entry curve
    ));
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

  // Function to handle insurance type selection
  void _selectAutoPlan(AutoPlans selectedAutoPlan) {
    setState(() {
      selectedNewAutoPlan = selectedAutoPlan;

      // Show button with animation if it's not already shown
      if (!_showButton) {
        _showButton = true;
        _buttonAnimationController.forward();
      }
    });
  }

  void _unSelectAutoPlan() {
    setState(() {
      selectedNewAutoPlan = null;

      // Show button with animation if it's not already shown
      if (_showButton) {
        _showButton = false;
        _buttonAnimationController.reverse();
      }
    });
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
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    semiBoldText(
                      'Protect your vehicles',
                      fontSize: 20.sp,
                      color: CustomColors.primaryGreenColor,
                    ),
                    verticalSpacer(8.h),
                    mediumText(
                      'Select and purchase an auto plan',
                      fontSize: 14.sp,
                      color: CustomColors.primaryGreenColor,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.whiteColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      ConstantString.autoCoverIllus,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
            // verticalSpacer(43.h),
            verticalSpacer(30.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ComprehensiveAutoContainer(
                    showUpgradeIcon: false,
                    isSelected:
                        selectedNewAutoPlan == AutoPlans.comprehensiveAuto,
                    onTap: () {
                      setState(() {
                        if (selectedNewAutoPlan ==
                            AutoPlans.comprehensiveAuto) {
                          // selectedNewAutoPlan = null;
                          _unSelectAutoPlan();
                        } else {
                          // selectedNewAutoPlan = AutoPlans.comprehensiveAuto;
                          _selectAutoPlan(AutoPlans.comprehensiveAuto);
                        }
                      });
                    },
                  ),
                  horizontalSpacer(10.w),
                  MiniComprehensiveContainer(
                    showUpgradeIcon: false,
                    isSelected:
                        selectedNewAutoPlan == AutoPlans.miniComprehensive,
                    onTap: () {
                      setState(() {
                        if (selectedNewAutoPlan ==
                            AutoPlans.miniComprehensive) {
                          // selectedNewAutoPlan = null;
                          _unSelectAutoPlan();
                        } else {
                          // selectedNewAutoPlan = AutoPlans.miniComprehensive;
                          _selectAutoPlan(AutoPlans.miniComprehensive);
                        }
                      });
                    },
                  ),

                  horizontalSpacer(10.w),
                  ThirdPartyContainer(
                    showUpgradeIcon: false,
                    isSelected: selectedNewAutoPlan == AutoPlans.thirdParty,
                    onTap: () {
                      setState(() {
                        if (selectedNewAutoPlan == AutoPlans.thirdParty) {
                          // selectedNewAutoPlan = null;
                          _unSelectAutoPlan();
                        } else {
                          // selectedNewAutoPlan = AutoPlans.thirdParty;
                          _selectAutoPlan(AutoPlans.thirdParty);
                        }
                      });
                    },
                  ),

                  // HealthPlanDetailsContainer(),
                ],
              ),
            ),
            // verticalSpacer(32.h),

            Spacer(),
            _showButton
                ? SlideTransition(
                    position: _buttonSlideAnimation,
                    child: CustomButton(
                      title: 'Continue',
                      onTap: () {
                        context.pushNamed(
                          RouteConstants.autoPlanDetailsScreen,
                          extra: AutoPlanDetailsModel(
                            selectedPlan: selectedNewAutoPlan!,
                          ),
                        );
                        // widget.onNext();
                      },
                    ),
                  )
                : SizedBox(height: 48.h),
            verticalSpacer(MediaQuery.of(context).padding.bottom + 30),
          ],
        ),
      ),
    );
  }
}

class ComprehensiveAutoContainer extends StatelessWidget {
  // final String title, subtitle, benefit
  final bool isSelected, showUpgradeIcon;
  final void Function()? onTap;
  const ComprehensiveAutoContainer({
    super.key,
    required this.isSelected,
    this.onTap,
    this.showUpgradeIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280.w,
        height: 310.h,
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
                ConstantString.comprehensiveAutoIllus,
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
                          'Comprehensive Auto',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                        ),
                      ),
                      if (showUpgradeIcon)
                        SvgPicture.asset(
                          isSelected
                              ? ConstantString.selectedDowngradeIcon
                              : ConstantString.downgradeIcon,
                        ),
                    ],
                  ),
                  verticalSpacer(4.h),
                  mediumText(
                    'Full protection for your vehicle, third parties, and added benefits like towing and tracking.',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                  ),
                  verticalSpacer(24.h),
                  PlanBenefitText(
                    title: 'Full vehicle damage & fire protection',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),
                  PlanBenefitText(
                    title: 'Theft compensation',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),

                  PlanBenefitText(
                    title: 'Unlimited third-party injury coverage',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),

                  PlanBenefitText(
                    title:
                        'Third-party property damage (based on vehicle value)',
                    isSelected: isSelected,
                  ),
                  // verticalSpacer(8.h),

                  Spacer(),
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
                            horizontal: 10.w, vertical: 5.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "From 5%",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "/ vehicle value",
                                style: CustomTextStyles.medium(
                                  fontSize: 13.sp,
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

class MiniComprehensiveContainer extends StatelessWidget {
  // final String title, subtitle, benefit
  final bool isSelected, showUpgradeIcon;
  final void Function()? onTap;
  const MiniComprehensiveContainer({
    super.key,
    required this.isSelected,
    this.onTap,
    this.showUpgradeIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280.w,
        height: 310.h,
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
                ConstantString.miniComprehensiveIllus,
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
                          'Mini Comprehensive',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                        ),
                      ),
                      if (showUpgradeIcon)
                        SvgPicture.asset(
                          isSelected
                              ? ConstantString.selectedDowngradeIcon
                              : ConstantString.downgradeIcon,
                        ),
                    ],
                  ),
                  verticalSpacer(4.h),
                  mediumText(
                    'Budget-friendly coverage with accident protection and third-party benefits.',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                  ),
                  verticalSpacer(24.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Vehicle damage protection (",
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
                            text: "Third-party property damage (",
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
                            text: "3,000,000)",
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
                    title: 'Unlimited third-party injury coverage',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),

                  // verticalSpacer(8.h),

                  Spacer(),
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
                            horizontal: 10.w, vertical: 5.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "From ",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "₦",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "25,000",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "/ vehicle annually",
                                style: CustomTextStyles.semiBold(
                                  fontSize: 11.sp,
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

class ThirdPartyContainer extends StatelessWidget {
  // final String title, subtitle, benefit
  final bool isSelected, showUpgradeIcon;
  final void Function()? onTap;
  const ThirdPartyContainer({
    super.key,
    required this.isSelected,
    this.onTap,
    this.showUpgradeIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280.w,
        height: 310.h,
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
                ConstantString.thirdPartyIllus,
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
                          'Third Party',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                        ),
                      ),
                      if (showUpgradeIcon)
                        SvgPicture.asset(
                          isSelected
                              ? ConstantString.selectedDowngradeIcon
                              : ConstantString.downgradeIcon,
                        ),
                    ],
                  ),
                  verticalSpacer(4.h),
                  mediumText(
                    'Essential legal protection covering damages and injuries to third parties.',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                  ),
                  verticalSpacer(24.h),
                  PlanBenefitText(
                    title: '',
                    isSelected: isSelected,
                    titleBody: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Third-party property damage (",
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
                            text: "3,000,000)",
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
                    title: 'Unlimited third-party injury coverage',
                    isSelected: isSelected,
                  ),
                  verticalSpacer(8.h),

                  // verticalSpacer(8.h),

                  Spacer(),
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
                            horizontal: 10.w, vertical: 5.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "From ",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "₦",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "15,000",
                                style: CustomTextStyles.bold(
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "/ vehicle annually",
                                style: CustomTextStyles.semiBold(
                                  fontSize: 11.sp,
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
