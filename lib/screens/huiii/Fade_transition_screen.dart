import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/animated_list_selector.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

// 1. First, define a custom page transition for the fade effect
class FadePageTransition extends CustomTransitionPage<void> {
  FadePageTransition({
    required Widget child,
    String? name,
    Object? arguments,
    LocalKey? key, // Changed from Key? to LocalKey?
  }) : super(
          key: key,
          name: name,
          arguments: arguments,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: child,
        );
}

class SelectAccountType extends StatefulWidget {
  const SelectAccountType({super.key});

  @override
  State<SelectAccountType> createState() => _SelectAccountTypeState();
}

class _SelectAccountTypeState extends State<SelectAccountType>
    with SingleTickerProviderStateMixin {
  AccountType? accountType;
  late AnimationController _buttonAnimationController;
  late Animation<Offset> _buttonSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for the button slide effect
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // Define the slide animation from center to bottom
    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.8), // Start from middle of screen
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: Curves.easeOutCubic,
    ));

    // Start the button animation after a short delay (after screen fades in)
    Future.delayed(const Duration(milliseconds: 100), () {
      _buttonAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

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
              'Who are you signing up as?',
              fontSize: 24.sp,
              color: CustomColors.green400Color,
              textAlign: TextAlign.center,
              letterSpacing: 0,
            ),
            verticalSpacer(12.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: mediumText(
                'Select the option that fits you best to get started.',
                fontSize: 16.sp,
                color: CustomColors.greenTextColor,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpacer(40.h),
            ListOptionsContainer(
              title: "I'm new here",
              subTitle: "Ready to create an account & get covered.",
              icon: ConstantString.newProfileDark,
              selectedIcon: ConstantString.newProfileColor,
              isSelected: accountType == AccountType.newAccount,
              onTap: () => setState(() {
                accountType = AccountType.newAccount;
              }),
            ),
            verticalSpacer(20),
            ListOptionsContainer(
              title: "I have an account",
              subTitle: "I want to login to my dashboard.",
              icon: ConstantString.existingProfileDark,
              selectedIcon: ConstantString.existingProfileColor,
              isSelected: accountType == AccountType.existingAccount,
              onTap: () => setState(() {
                accountType = AccountType.existingAccount;
              }),
            ),
            verticalSpacer(20),
            ListOptionsContainer(
              title: "I was gifted a plan",
              subTitle: "I want to log in as a staff / dependant",
              icon: ConstantString.companyProfileDark,
              selectedIcon: ConstantString.companyProfileColor,
              isSelected: accountType == AccountType.companyAccount,
              onTap: () => setState(() {
                accountType = AccountType.companyAccount;
              }),
            ),
            Spacer(),
            // Wrap the button in SlideTransition for the slide effect
            SlideTransition(
              position: _buttonSlideAnimation,
              child: CustomButton(
                  title: 'Continue',
                  onTap: accountType == null
                      ? null
                      : () {
                          if (accountType == AccountType.newAccount) {
                            context
                                .pushNamed(RouteConstants.mainOnboardingScreen);
                          } else if (accountType ==
                              AccountType.existingAccount) {
                            context.pushNamed(RouteConstants.loginScreen);
                          } else if (accountType ==
                              AccountType.companyAccount) {
                            context.pushNamed(
                                RouteConstants.businessStaffLoginScreen);
                          }
                        }),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

// 2. Update your GoRouter configuration to use the custom transition
// Add this to your router configuration
// GoRoute(
//   name: RouteConstants.selectAccountType,
//   path: '/select-account-type',
//   pageBuilder: (context, state) {
//     return FadePageTransition(
//       child: const SelectAccountType(),
//       name: state.name,
//       arguments: state.extra,
//     );
//   },
// ),
