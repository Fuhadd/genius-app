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
import 'package:genius_app/widgets/plan_grid_options_container.dart';
import 'package:go_router/go_router.dart';

class BuyPlansScreen extends StatefulWidget {
  const BuyPlansScreen({
    super.key,
  });

  @override
  State<BuyPlansScreen> createState() => _BuyPlansScreenState();
}

class _BuyPlansScreenState extends State<BuyPlansScreen>
    with SingleTickerProviderStateMixin {
  InsuranceType? gender;
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
  void _selectInsuranceType(InsuranceType selectedInsuranceType) {
    setState(() {
      gender = selectedInsuranceType;

      // Show button with animation if it's not already shown
      if (!_showButton) {
        _showButton = true;
        _buttonAnimationController.forward();
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
            verticalSpacer(20.h),
            Row(
              children: [
                Expanded(
                  child: boldText(
                    'Buy New Plan',
                    fontSize: 24.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                ),
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.whiteColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      ConstantString.buyPlanIllus,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(53.h),
            Row(
              children: [
                PlanGridOptionsContainer(
                  title: "Health Cover",
                  icon: ConstantString.healthCoverIllus,
                  isSelected: gender == InsuranceType.health,
                  onTap: () => _selectInsuranceType(InsuranceType.health),
                  // onTap: () => setState(() {
                  //   gender = Gender.male;
                  // }),
                ),
                horizontalSpacer(20),
                PlanGridOptionsContainer(
                  title: "Auto Cover",
                  icon: ConstantString.autoCoverIllus,
                  isSelected: gender == InsuranceType.vehicle,
                  onTap: () => _selectInsuranceType(InsuranceType.vehicle),
                  // onTap: () => setState(() {
                  //   gender = Gender.female;
                  // }),
                ),
              ],
            ),
            verticalSpacer(24.h),
            Row(
              children: [
                PlanGridOptionsContainer(
                  title: "Gadget Cover",
                  icon: ConstantString.gadgetCoverIllus,
                  isSelected: gender == InsuranceType.gadget,
                  onTap: () => _selectInsuranceType(InsuranceType.gadget),
                  // onTap: () => setState(() {
                  //   gender = Gender.male;
                  // }),
                ),
                horizontalSpacer(20),
                PlanGridOptionsContainer(
                  title: "Travel Cover",
                  icon: ConstantString.travelCoverIllus,
                  isSelected: gender == InsuranceType.travel,
                  onTap: () => _selectInsuranceType(InsuranceType.travel),
                  // onTap: () => setState(() {
                  //   gender = Gender.female;
                  // }),
                ),
              ],
            ),
            Spacer(),
            _showButton
                ? SlideTransition(
                    position: _buttonSlideAnimation,
                    child: CustomButton(
                      title: 'Continue',
                      onTap: () {
                        if (gender == InsuranceType.vehicle) {
                          context.pushNamed(
                            RouteConstants.selectAutoPlanScreen,
                          );
                        }

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
